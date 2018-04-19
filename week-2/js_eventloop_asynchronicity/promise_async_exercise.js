const promise1 = Promise.resolve(3);
const promise2 = 42;
const promise3 = new Promise(function(resolve, reject) {
  setTimeout(resolve, 5000, 'foo');
});
const promise4 = "Goodbye for real!";

const example1 = () => {
  console.log("Hello!");
  Promise.all([promise1, promise2, promise3, promise4]).then(values => console.log(values));
  console.log("Goodbye?");
};











































const promise5 = 56;
const promise6 = 10000000000 % 2456;
const promise7 = arg => `${arg} synchronous promises...?`;

const example2 = () => {
  console.log("Hello again!");
  Promise.all([promise5, promise6, promise7("I love")]).then(values => console.log(values));
  console.log("Will I be before, or after?");
};












































function resolveAfter2Seconds(x) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(x);
    }, 2000);
  });
}

async function f1() {
  var x = await resolveAfter2Seconds(10);
  console.log(x); // 10
}






















async function f2() {
  var y = await 20;
  console.log(y); // 20
}


const example3 = () => {
  f2();
  console.log("When do I show up?");
};

























async function f4() {
  const promise8 = new Promise(function(resolve, reject) {
    setTimeout(resolve, 5000, 'foo');
  });
  const promise9 = new Promise(function(resolve, reject) {
    setTimeout(resolve, 5000, 'bar');
  });

  let foo = await promise8;
  let bar = await promise9;
  console.log('waiting...');

  console.log(`async/await + ${[foo, bar]}`);
}
//
function f5() {
  const promise10 = new Promise(function(resolve, reject) {
    setTimeout(resolve, 5000, 'biz');
  });
  const promise11 = new Promise(function(resolve, reject) {
    setTimeout(resolve, 5000, 'biz');
  });

  Promise.all([promise10, promise11]).then( values => console.log(`Promises + ${values}`) );
  console.log('not waiting!');
}
//
const lastFunc = () => {
    f4();
    f5();
};
