Regex in Python
===============

Python uses for `re` module for regular expressions. It usually starts out like `prog = re.compile(pattern)`, and then running a [method](#methods) like `match()` or `search()` on `prog`.

The following is a complete example which finds a phone number in a larger string.

```python
prog = re.compile(r'(\d{3})[-).\s][\s]?(\d{3}[-.\s]?\d{4})')
number = prog.search('This is my phone number: 123-4567-8901. Call me.')
print(number)  # 123-4567-8901
```

Very handy regex playground: https://pythex.org/.

Methods
-------

`findall()` Looks for all occurances of a patterh and returns a list. If returned list contains groups, those groups will be in tuples. E.g. `re.compile(r'a').findall('a dog is a type of animal')` would return `['a', 'a', 'a', 'a']` as there are four "a's" in the searched string.

`search()` Looks for the first occurance of a pattern and returns a `Match` object. E.g. `re.compile(r'a').search('a dog is a type of animal')` would return a `Match` object with property `match='a'`.

`match()` Works like `search()` but checks only at the beginning of a string. (`search()` checks everywhere.)

Matching patterns
-----------------

`{x,y}` matches a number of occurances of the preceeding expression at a minimum of `x` and a maximum of `y`. If only one value is given, the match will operate on that number of occurances. `{x,}` will match any number of occurances equal to or greater than `x`, and `{,y}` will match 0 to the value of `y` occurances. The returned value is the longest possible match by default; when followed by a `?`, as in `{x,y}?`, it returns the shortest.

`[]` matches characters inside the brackets. Emphasis on "characters", not "string". `[abc]` would look for `a`, `b`, and `c`, not `abc`. Special characters (`?`, `*`, etc.) are taken literally inside `[]` and do not need to be escaped. It can also look for ranges of whole numbers and letters. `[0-5]` matches numbers between and including 0 and 5; `[a-z]` matches all lowercase letters; `[a-zA-Z]` matches all lowercase and uppercase letters.

`?` Preceeding part is optional. E.g. `wolf(-)?dog` will match both `wolf-dog` and `wolfdog`.

`*` Preceeding part repeats zero or multiple times. E.g. `English(Pera)?Language` will match `EnglishLanguage`, `EnglishPeraLanguage`, and `EnglishPeraPeraPeraLanguage`.

`+` It's like `*` but requires at least one occurance.

`^` When placed at the beginning of a regex, indicates that match must begin with the following pattern. E.g. `r'^hello'` will return `True` when searching the string `hello world` but not `greetings and hello`.

`$` When placed at the end of a regex, indicates that match much end with the following pattern. E.g. `r'$world'` will return `True` when searching the string `hello world` but not `hello world goodbye`.

`.` Matches any character except for newline.

`.*` Matches everything except for newline, returning the largest thing found. To return smallest thing found, use `.*?`. To include newline, use `re.compile('.*', re.DOTALL)`.

Character classes
-----------------

There are a number of built-in character classes:

`\d` Any number from 0 to 9

`\D` Any character that is not a number from 0 to 9

`\w` Any letter, number, or the underscore character

`\W` Any character that is not a letter, number, or the underscore character

`\s` Any space, tab, or newline character

`\S` Any character that is not a space, tab, or newline

Sources
-------

- https://automatetheboringstuff.com/2e/chapter7/
- https://docs.python.org/3/library/re.html
