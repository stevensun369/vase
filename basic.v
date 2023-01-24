module vase

import net.http

fn put_items(b Base, items string) http.Response {
	mut fetch_config := b.config
	fetch_config.method = .put
	fetch_config.data = '{"items": $items}'
	fetch_config.url = fetch_config.url + '/items'

	res := http.fetch(fetch_config) or {
		println('nope')
		return http.Response {}
	}
	return res
}

fn get_item(b Base, key string) http.Response {
	mut fetch_config := b.config
	fetch_config.method = .get
	fetch_config.url = fetch_config.url + '/items/' + key

	res := http.fetch(fetch_config) or {
		println('nope')
		return http.Response {}
	}
	return res
}

fn delete_item(b Base, key string) http.Response {
	mut fetch_config := b.config
	fetch_config.method = .delete
	fetch_config.url = fetch_config.url + '/items/' + key

	res := http.fetch(fetch_config) or {
		println('nope')
		return http.Response {}
	}
	return res
}

fn insert_item(b Base, item string) http.Response {
	mut fetch_config := b.config
	fetch_config.method = .post
	fetch_config.url = fetch_config.url + '/items'
	fetch_config.data = '{"item": $item}'

	res := http.fetch(fetch_config) or {
		println('nope')
		return http.Response {}
	}
	return res
}

fn update_item(b Base, key string, update string) http.Response {
	mut fetch_config := b.config
	fetch_config.method = .patch
	fetch_config.url = fetch_config.url + '/items/' + key
	fetch_config.data = update

	res := http.fetch(fetch_config) or {
		println('nope')
		return http.Response {}
	}
	return res
}

fn query_items(b Base, query string) http.Response {
	mut fetch_config := b.config
	fetch_config.method = .post
	fetch_config.url = fetch_config.url + '/query'
	fetch_config.data = query

	res := http.fetch(fetch_config) or {
		println('nope')
		return http.Response {}
	}
	return res
}