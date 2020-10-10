OAuth
=====

*OAuth* is an open standard for access delegation, commonly used as a way for Internet users to grant websites or applications access to their information on other websites but without giving them the passwords. (From Wikipedia)

Grant types
-----------

A.k.a. "flow" types. Below are several (not an exhaustive list).

1. Authorisation code: front + back channel
2. Implicit: front channel only
3. Resource owner password credentials: back channel only
4. Client credentials: back channel only

Open ID Connect
---------------

*Open ID Connect* is an authentication layer which sits on top of OAuth. It is *not* the same thing as *Open ID*. Open ID is a completely separate protocol from OAuth.

OAuth requires an authentication layer because its intended use is for [authorisation](./index.md#authorisation-vs-authentication). In OAuth, there is no standard way of getting a user's information. It is intended to handle permissions and scopes (i.e. to answer the question, is this token scoped to access a particular thing) without actually knowing who the user is.

Open ID Connect adds the following:

- ID token: contains information on the user
- userinfo endpoint: request for information on user; uses access token, not ID token
- standard set of scopes
- standardised implementation

An Open ID Connect request is distinct from an OAuth request in that it includes `openid` in the scope of the request. When this happens, technically both an OAuth and Open ID request occur. The authorisation code is exchanged for an ID token and access token.

Sources
-------

- https://en.wikipedia.org/wiki/OAuth
- https://www.youtube.com/watch?v=996OiexHze0
- https://auth0.com/docs/authorization/which-oauth-2-0-flow-should-i-use
- https://oauthlib.readthedocs.io/en/latest/oauth2/grants/grants.html
