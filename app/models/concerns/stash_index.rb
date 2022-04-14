require "stash"

module StashIndex
  extend ActiveSupport::Concern

  included do
    before_save :ensure_stash_id
    after_save :cs_put
    after_destroy :cs_delete
  end

  def ensure_stash_id
    self.stash_id ||= SecureRandom.uuid
  end

  def cs_put
    puts "Indexing #{self.stash_id}"
    self.class.collection.put(self.stash_id, self)
  end

  def cs_delete
    self.class.collection.delete(self.stash_id)
  end

  class_methods do
    def search(field, condition, value)
      ids = collection.query(field, condition, value)
      where(stash_id: ids)
    end

    def reindex
      find_each(&:cs_put)
    end

    def collection
      @collection ||= Stash.connect(collection_name)
    end

    # Name of the Stash collection
    # Defaults to the name of the table
    def collection_name
      @collection_name || table_name
    end

    def collection_name=(name)
      @collection_name = name
    end
  end
end
