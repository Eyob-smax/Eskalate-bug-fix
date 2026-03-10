# Explanation

## What was the bug?

I found that `HttpClient.request` only worked properly when the token was a real `OAuth2Token` instance. If the token was a plain object, the request did not refresh it and did not set the `Authorization` header.

## Why did it happen?

I think this happened because the type allowed a plain object, but the runtime logic only trusted `instanceof OAuth2Token`. So when I had a token-shaped object, it was truthy, but it still failed the instance check.

## The fix actually solve it

I fixed it by treating anything that is not a real `OAuth2Token` as invalid for an authenticated request. That means when I was dealing with `null` or a plain object, the code refreshes first and then sets the header from a valid token.

## realistic case my tests still don’t cover

I did not test the case where a caller passes existing headers and we need to make sure those headers stay intact while authorization is added.
