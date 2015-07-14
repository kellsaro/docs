---
layout: page
title: Style conventions
categories: General
resource: true
description: Style conventions
index_order: 1
order: 1
---

#Style conventions

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Indent after `private/protected`.
* Prefer `&&/||` over `and/or`.
* Prefer `class «` self block over `self.method` for class methods.
* `my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` and `not a=b`.
* `{ a + b }` and not `{a + b}`
* `"string#{ expr }"` and not `"string#{expr}"`
* `->` symbol over `lambda`
* Ruby 1.9 hash syntax `{ key: :value }` over Ruby 1.8 hash syntax `{ :key => :value }`
* Alphabetize the class methods to keep them organized.
* Follow the conventions you see used in the source already.
* avoid double negations

* Indent when as deep as case. I know that many would disagree with this one, but it's the style established in both "The Ruby Programming Language" and "Programming Ruby".

```ruby
  # good
  case
  when song.name == 'Misty'
    puts 'Not again!'
  when song.duration > 120
    puts 'Too long!'
  when Time.now.hour > 21
    puts "It's too late"
  else
    song.play
  end
```

* When assigning the result of a conditional expression to a variable, preserve the usual alignment of its branches.

```ruby
  # good - it's apparent what's going on
  kind = case year
         when 1850..1889 then 'Blues'
         when 1890..1909 then 'Ragtime'
         when 1910..1929 then 'New Orleans Jazz'
         when 1930..1939 then 'Swing'
         when 1940..1950 then 'Bebop'
         else 'Jazz'
         end

  result = if some_cond
             calc_something
           else
             calc_something_else
           end

  # good (and a bit more width efficient)
  kind =
    case year
    when 1850..1889 then 'Blues'
    when 1890..1909 then 'Ragtime'
    when 1910..1929 then 'New Orleans Jazz'
    when 1930..1939 then 'Swing'
    when 1940..1950 then 'Bebop'
    else 'Jazz'
    end

  result =
    if some_cond
      calc_something
    else
      calc_something_else
    end
```

* Use one expression per branch in a ternary operator. This also means that ternary operators must not be nested. Prefer if/else constructs in these cases.

```ruby
  # bad
  some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

  # good
  if some_condition
    nested_condition ? nested_something : nested_something_else
  else
    something_else
  end
```

* Leverage the fact that if and case are expressions which return a result.

```ruby
  # bad
  if condition
    result = x
  else
    result = y
  end

  # good
  result =
    if condition
      x
    else
      y
    end
```

other references
[ruby style]( https://github.com/bbatsov/ruby-style-guide)