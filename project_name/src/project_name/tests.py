# -*- coding: utf-8 -*-
import unittest
from django.test.client import Client


class TestCase(unittest.TestCase):
    def test_home(self):
        c = Client()
        response = c.get('/')
        self.assertEqual(response.status_code, 200)
