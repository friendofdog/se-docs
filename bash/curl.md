Curl
====

Curl is a tool used for transfering data to and from servers. It supports commonly used protocols, including HTTP, FTP, SMTP, and POP. Some common use cases include downloading a file and fetching a webpage, and retrieving email.

According to the `man` page, `curl` is meant to be used with user interaction. Implicitly, that would mean that it is not intended for use in scripting where the user has no input.

`-O` Writes output to a local file with same name as the remote.

`-L` If the server reports that the requested resource has moved to a different location, the request is redone to that location. Effectively, this makes request follow redirects.
