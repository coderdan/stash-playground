class SchemaBuilder
  def initialize(model)
    @model = model
  end

  # TODO: all strings in one index
  # TODO: dates, integers
  def build
    @model.lockbox_attributes.inject({}) do |schema, (attr, settings)|
      case settings[:type]
        when :float
          range_index!(schema, attr)
      end
      schema
    end
  end

  def range_index!(schema, name)
    schema.tap do |schema|
      schema["#{name}"] = { kind: "range", field: "#{name}" }
    end
  end

  def string_index!(schema, settings)
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
end
