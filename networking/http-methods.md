HTTP Methods
============

Idempotence and safety
----------------------

A method is safe when it does not modify resources or otherwise change the state of the server. This is a loose definition, as any call could affect things like activity logs; but principle safe methods are deemed to be risk-free. Includes `GET`, `HEAD`, and `OPTIONS`. All safe methods are also idempotent.

A method is idempotent when it can be called many times with the same result. For example, `num = 4` is idempotent because `num` will be `4` every time. `num += ` is not idempotent because the value of `num` differs with every call. Includes `GET`, `HEAD`, `PUT`, and `DELETE`.

`POST` is neither safe nor idempotent.

Method definitions
------------------

### GET

### HEAD

### POST

`POST` is commonly used to create a new resource. It asks that a new entity be created as a subordinate of the collection supplied in the URI (according to the resource's own specific semantics).

The URI is that of a collection, not of the intended resource. E.g. `/animals` is valid (assuming that there is a collection called "animals", under which a new resource should be created).

`POST` is not idempotent, meaning that with every request a new resource will be created.

### PUT

`PUT` is commonly used to update a resource. It replaces the target resource entirely with the state defined in the enclosed representation (as opposed to `PATCH`, which updates only part of a resource). If a resource does not exist at the supplied URI, one will be created.

The contents of a `PUT` request are stored under the request URI. Therefore, the request URI is not for a collection, but for a single resource. E.g. `/animals/dog` is valid, but `/animals` is not, because it is (in this instance) for the collection "animals".

`PUT` is idempotent, meaning that no matter how many times you run the same request the it results in the same changes.

### DELETE

### CONNECT

### OPTIONS

### TRACE

| Method  | Idempotent | Safe       | Cacheable  |
| ------- | ---------- | ---------- | ---------- |
| GET     | yes        | yes        | yes        |
| HEAD    | yes        | yes        | yes        |
| POST    | no         | no         | sort of*   |
| PUT     | yes        | no         | no         |
| DELETE  | yes        | no         | no         |
| CONNECT |            |            | no         |
| OPTIONS | yes        | yes        | no         |
| TRACE   |            |            | no         |

\* `POST` requests are only cacheable when they include [explicit freshness information](https://tools.ietf.org/html/rfc7234#section-4.2.1). In practice, `POST` requests are not often cached.

Sources
-------

- https://tools.ietf.org/html/rfc7231#page-24
- https://restfulapi.net/rest-put-vs-post/
- https://developer.mozilla.org/en-US/docs/Glossary/Idempotent
- https://developer.mozilla.org/en-US/docs/Glossary/safe
