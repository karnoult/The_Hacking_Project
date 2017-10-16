## THP - Projets complétés

Plus d'info sur The Hacking Project : [ici](http://www.thehackingproject.org/)

### Docs

- **HTML**: https://developer.mozilla.org/en-US/docs/Web/HTML/Reference
- **CSS**: https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
- **Ruby**
  - **Core**: http://ruby-doc.org/core-2.4.2/
  - **Style guide**: https://github.com/bbatsov/ruby-style-guide
  - **Gems**
    - **Pry** (runtime dev console): https://github.com/pry/pry/wiki
    - **Nokogiri** (HTML parser w/ CSS and XPATH): http://www.rubydoc.info/github/sparklemotion/nokogiri
    - **Watir** (web app testing)
      - http://www.rubydoc.info/gems/watir/
      - http://watir.com/guides/
    - **Twitter**: http://www.rubydoc.info/gems/twitter
    - **Google Drive** (read/write Google Drive files/spreadsheets): https://github.com/gimite/google-drive-ruby
- **Github** formatting: https://help.github.com/articles/basic-writing-and-formatting-syntax/

### Ruby basics
- Display in the terminal
`puts "Hello World!"`
- Assign a value to a variable
  - an Integer `my_variable = 1`
  - a Table
  ```
  my_variable = ["Jack", "Katelyn", "Zoe"]
  my_variable << "Isa"
  ```
  - a Hash
  ```
  my_variable = {name: "Jack", city: "New-York"}
  my_variable = {:name => "Jack", :city => "New-York"} // older syntax
  my_variable[:age] = 45
  ```
  - an instance of any Object `my_variable = my_instance`
- Iterate through a table
```
  my_table.each do |my_value|
    ...
  end
```
- Iterate through a hash
```
my_hash.each do |key, value|
  ...
end
```

- Loop
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

- Define a class
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

- Get all methods of a class
`Integer.instance_methods(false)`

- Manage exceptions
```
begin
  ... instructions ...
rescue ERROR_TO_CATCH => my_error
  ... instructions ...
end
```
