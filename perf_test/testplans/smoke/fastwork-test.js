import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  vus: 3,
  duration: '30s',
};

export default function () {
  // 1. Open fastwork web
  let res1 = http.get('https://fastwork.co/');
  check(res1, {
    'open fastwork web - status 200': (r) => r.status === 200,
  });

  // 2. Go to login
  let res2 = http.get('https://auth2.fastwork.co/oauth/authorize');
  check(res2, {
    'go to login - status 200': (r) => r.status === 200,
  });

  // 3. Login valid user
  let payload = JSON.stringify({
    auth_user: '+66954901028',
    password: 'Nirawit0053++',
  });

  let params = {
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  };

  let res3 = http.post('https://api.fastwork.co/auth/v2/login', payload, params);
  check(res3, {
    'login request - status 200': (r) => r.status === 200,
    'login request - status 400 (invalid credit)': (r) => r.status === 400,
  });

  sleep(1);
}