const Koa = require('koa');

const app = new Koa();

app.use(async (ctx) => {
  // throw new Error('throw error in app');
  ctx.body = 'Hello World';
});

app.listen(3000, () => {
  console.log('server is running at: http://localhost:3000');
});