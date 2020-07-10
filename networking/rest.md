Representational State Transfer (REST)
======================================

Notes
-----

From https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/

- Send and accept data in JSON. Reponse headers should have `Content-Type` set to `application/json`.
- Files should be handled as form data.
- Endpoints should return JSON data. No endpoint should be a string or non-JSON object on its own.
- Use nouns for endpoints, not verbs. When describing the structure of a REST API, the calls made are the "verbs"; they act on the endpoints, which are the "nouns".
- Collection endpoints should be named using plural nouns. This both clarifies that something is a collection and is consistent with the way things are named in databases.

Sources
-------

- https://swagger.io/specification/
