module vase

import net.http
import json

pub struct Base {
	pub:
	config http.FetchConfig	
}

pub fn (b Base) put<T>(items T) http.Response {
	items_json := json.encode(items)
	return put_items(b, items_json)
}

pub fn (b Base) get(key string) http.Response {
	return get_item(b, key)
}

pub fn (b Base) del(key string) http.Response {
	return delete_item(b, key)
}

pub fn (b Base) insert<T>(item T) http.Response {
	item_json := json.encode(item)
	return insert_item(b, item_json)
}

pub fn (b Base) update(key string, updates Updates) http.Response {
	mut update_data := '{'
	if updates.set != "" {
		update_data += '"set": $updates.set'
	}
	if updates.increment != "" {
		update_data += ', "increment": $updates.increment'
	}
	if updates.append != "" {
		update_data += ', "append": $updates.append'
	}
	if updates.prepend != "" {
		update_data += ', "prepend": $updates.prepend'
	}
	if updates.delete != "" {
		update_data += ', "delete": $updates.delete'
	}
	update_data += '}'

	return update_item(b, key, update_data)
}

pub fn (b Base) query(query Query) http.Response {
	mut query_data := '{'
	if query.query != "" {
		query_data += '"query": $query.query'
	}
	if query.limit != "" {
		query_data += ', "limit": $query.limit'
	}
	query_data += '}'

	// return http.Response {}
	return query_items(b, query_data)
}
