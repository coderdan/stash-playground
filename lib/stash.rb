class Stash
  def self.connect(collection_name)
    puts "Doing us a connect to #{collection_name}"
    sleep 0.5
    new(collection_name)
  end

  def initialize(name)
    @collection_name = name
  end

  def put(id, record)
    raise "Missing record" if record.nil?
    doc = Document.find_by(id: id)
    doc ||= Document.new(id: id)
    doc.body = record.attributes
    doc.save!
  end

  def delete(id)
    Document.find(id).destroy!
  end

  def query(field, constraint, value)
    q =
    case constraint
    when "eq"
      Document.where(["body ->> '#{field}' = ?", value])
    end
    q.select(:id).map(&:id)
  end
end
