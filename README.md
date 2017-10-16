## THP - Projets complétés

Plus d'info sur The Hacking Project : [ici](http://www.thehackingproject.org/)

### Docs

- **HTML**: https://developer.mozilla.org/en-US/docs/Web/HTML/Reference
- **CSS**: https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
- **Ruby**
  - **Core**: http://ruby-doc.org/core-2.4.2/
  - **Gems**
    - Pry (runtime dev console): https://github.com/pry/pry/wiki
    - **Nokogiri** (HTML parser): http://www.rubydoc.info/github/sparklemotion/nokogiri
    - Watir (web app testing)
      - http://www.rubydoc.info/gems/watir/
      - http://watir.com/guides/
    - Twitter: http://www.rubydoc.info/gems/twitter
- Github formatting: https://help.github.com/articles/basic-writing-and-formatting-syntax/

### Ruby basics

- Assign a value to a variable:
  - an Integer `my_variable = 1`
  - a Table `my_variable = ["Jack", "Katelyn", "Zoe"]`
  - a Hash `my_variable = {:name = "Jack", :city = "New-York"}`
  - an instance of any Object: `my_variable = my_instance`
- Navigate through a table:
```
  my_table.each do |my_value|
    ...
  end
```
- Loop:
```
(1..100).select do |i|
  ...
end
```

```
100.times do |i|
  ...
end
```

- Define a class:
```
class MyClassName

  attr_accessor :my_attribute

  def initialize
    @my_attribute = "toto"
    ...
  end
  
  def my_method
    ...
  end
end
```
- Manage exceptions:
```
begin
  ... instructions ...
rescue ERROR_TO_CATCH => my_error
  ... instructions ...
end
```
