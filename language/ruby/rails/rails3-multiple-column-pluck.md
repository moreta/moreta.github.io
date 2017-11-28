


```rb
# pluck_all.rb
module ActiveRecord
  class Relation
    def pluck_all(*args)
      args.map! do |column_name|
        if column_name.is_a?(Symbol) && column_names.include?(column_name.to_s)
          "#{connection.quote_table_name(table_name)}.#{connection.quote_column_name(column_name)}"
        else
          column_name.to_s
        end
      end

      relation = clone
      relation.select_values = args
      klass.connection.select_all(relation.arel).map! do |attributes|
        initialized_attributes = klass.initialize_attributes(attributes)
        attributes.each do |key, attribute|
          attributes[key] = klass.type_cast_attribute(key, initialized_attributes)
        end
      end
    end
  end
end
# post_controller.rb
Post.where(category: 'cats').pluck_all(:id, :created_at)
```

# References

+ [Plucking Multiple Columns in Rails 3](http://meltingice.net/2013/06/11/pluck-multiple-columns-rails/)