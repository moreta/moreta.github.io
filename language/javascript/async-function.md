Javascript Async(await) Function
=========================

* async/awaitは ES2016 spec

## Async functionはいつも promiseをreturnする

Async return values

```js
// wait ms milliseconds
function wait(ms) {
  return new Promise(r => setTimeout(r, ms));
}

// …calling hello() returns a promise that fulfills with "world".
async function hello() {
  await wait(500);
  return 'world';
}

// …calling foo() returns a promise that rejects with Error('bar').
async function foo() {
  await wait(500);
  throw Error('bar');
}
```

# Example

## Logging a fetch

fetch apiを loogin

promiseを利用

```js
function logFetch(url) {
  return fetch(url)
    .then(response => response.text())
    .then(text => {
      console.log(text);
    }).catch(err => {
      console.error('fetch failed', err);
    });
}
```
async/awaitを利用(これは上と同じ)

```js
async function logFetch(url) {
  try {
    const response = await fetch(url);
    console.log(await response.text());
  }
  catch (err) {
    console.log('fetch failed', err);
  }
}
```

## Streaming a response

```js
function getResponseSize(url) {
  return fetch(url).then(response => {
    const reader = response.body.getReader();
    let total = 0;

    return reader.read().then(function processResult(result) {
      if (result.done) return total;

      const value = result.value;
      total += value.length;
      console.log('Received chunk', value);

      return reader.read().then(processResult);
    })
  });
}
```

same with above

```js
async function getResponseSize(url) {
  const response = await fetch(url);
  const reader = response.body.getReader();
  let result = await reader.read();
  let total = 0;

  while (!result.done) {
    const value = result.value;
    total += value.length;
    console.log('Received chunk', value);
    // get the next result
    result = await reader.read();
  }

  return total;
}
```

# References

+ [Async functions - making promises friendly](https://developers.google.com/web/fundamentals/getting-started/primers/async-functions)
