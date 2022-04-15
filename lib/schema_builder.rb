class SchemaBuilder
  def initialize(model)
    @model = model
  end

  # TODO: all strings in one index
  # TODO: dates, integers
  def build
    encrypted_columns.inject({}) do |schema, pair|
      case pair[1]
      when string_index!(schema, pair[0])
      end
      schema
    end
  end

  def string_index!(schema, name)
    schema["#{name}_exact"] = { kind: "exact", field: name }
    schema["#{name}_match"] = {
      kind: "match",
      fields: [name],
      tokenFilters: [
        { kind: "downcase" },
        { kind: "ngram", tokenLength: 3 }
      ],
      tokenizer: { kind: "standard" }
    }

    schema
  end

  def encrypted_columns
    @model.encrypted_attributes.map do |attr|
      [attr, User.columns_hash[attr.to_s].type]
    end
  end
end
