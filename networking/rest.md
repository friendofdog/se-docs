Representational State Transfer (REST)
======================================

Idempotence and safety
----------------------

A method is safe when it does not modify resources or otherwise change the state of the server. This is a loose definition, as any call could affect things like activity logs; but principle safe methods are deemed to be risk-free. Includes `GET`, `HEAD`, and `OPTIONS`. All safe methods are also idempotent.

A method is idempotent when it can be called many times with the same result. For example, `num = 4` is idempotent because `num` will be `4` every time. `num += ` is not idempotent because the value of `num` differs with every call. Includes `GET`, `HEAD`, `PUT`, and `DELETE`.

`POST` is neither safe nor idempotent.

| Method  | Idempotent | Safe       |
| ------- | ---------- | ---------- |
| OPTIONS | yes        | yes        |
| GET     | yes        | yes        |
| HEAD    | yes        | yes        |
| PUT     | yes        | no         |
| POST    | no         | no         |
| DELETE  | yes        | no         |
| PATCH   | no         | no         |

Sources
-------

- https://developer.mozilla.org/en-US/docs/Glossary/Idempotent
- https://developer.mozilla.org/en-US/docs/Glossary/safe
