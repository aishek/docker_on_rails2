start:
	overmind start

stop:
	overmind stop

tests:
	bundle exec rails test

test-system:
	SELENIUM_URL=http://localhost:4444/wd/hub bundle exec rails test:system
