import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
    scenarios: {
        smoke: {
            executor: 'ramping-vus',
            stages: [
                { duration: '1m', target: 100 },
                { duration: '2m', target: 500 },
                { duration: '1m', target: 100 },
                { duration: '2m', target: 500 },
                { duration: '1m', target: 0 },
            ],
            gracefulRampDown: '30s', // ✅ ใช้อันนี้แทน maxDuration
        },
    },
    thresholds: {
        http_req_failed: ['rate<0.01'],
        http_req_duration: ['p(95)<600'],
    },
};

export default function () {
    const res = http.get('https://test.k6.io/');
    check(res, {
        'is status 200': (r) => r.status === 200,
    });
    sleep(1);
}

export function Test_Login() {
    const payload = JSON.stringify({
        name : "emilys",
        password : "emilyspass"
    });

    const params = {
        headers: {
            'Content-Type': 'application/json',
        },
    };
    const res = http.post('https://dummyjson.com/auth/login', payload, params);

    check(res, {
        'login ok': (r) => r.status === 200,
        'verify acccount name is emilys': (r) => r.body.includes('emilys'),
        'verify homepage text content': (r) => r.body.includes('Collection of simple web-pages suitable for load testing'),
        'response body contains access_token': (r) => r.body.includes('accessToken')
    }, { type: 'login' });

    const authToken = res.json('accessToken');
      check(authToken, {
        'token is not null': (t) => t !== null,
        'token is a string': (t) => typeof t === 'string',
        'token has expected length': (t) => t.length > 0, // Or a specific length
      });
};

sleep(0.2);