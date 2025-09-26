import http from "k6/http";
import { check, sleep } from "k6";

export const options = {
    stages: [
        { duration: '2m', target: 100 }, // simulate ramp up of traffic from 1 to 100 users over 5 minutes
        { duration: '5m', target: 1000}, // stay at 1000 users for 10 minutes
        { duration: '2m', target: 0}, // ramp down to 0 user
    ],
    thresholds: {
        'http_req_duration': ['p(95)<500'], //99% or requests must complete below 0.5s
    },
};

export default function(){

    const url = 'https://practicetestautomation.com/practice-test-login/';

    const headers = {
        headers: {
            'Content-Type': 'application/json',
        },
    };

    const res = http.get(url,headers);

    check(res, {
        'is status 200': (r) => res.status === 200
    });
}

export function Login(){
    const url = 'https://practicetestautomation.com/practice-test-login/';
    const payload = JSON.stringify({
        username: 'student',
        password: 'Password123'
    });

    const res = http.post(url,headers);

    check(res, {
        'is status 200': (r) => res.status === 200,
        'is res body has username': (res) => res.body.includes('kminchelle'),
    });
}
