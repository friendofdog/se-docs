Identity and Access Management (IAM)
====================================

User: a permanent, named operator (human or machine). Credentials are permanent and stay with that user unless explicitly changed.

Group: a collections of users. Can have many users, users can have many groups.

Role: an authentication method (not a user's permissions). Can be human or machine. Credentials with a role are temporary.

Policy document: whitelists API or group of APIs against resources. JSON document which attaches directly to user, group, or role. Includes conditions, such as time of day, VPN use, etc. Can also blacklist (explicit deny), which permanently deny actions from happening. Blacklisting takes higher priority over whitelist. Can be used as extra security error to compensate for compromised credentials.

Everything in AWS is an API; when an API call is made, the credentials are part of this call and are the first thing checked and are done so by policy documents.

Every API action is recorded in CloudTrail, whether accepted or declined.

The AWS CLI call for IAM is `aws iam`.
