module vase

import net.http

// the connection struct
// will hold the project key and project id
pub struct Conn {
	pub:
	project_id string
	project_key string
}

pub fn (c Conn) get_base(base_name string) Base {
	mut fetch_config := c.get_fetch_config()
	fetch_config.url = fetch_config.url + '/$base_name'

	base := Base {
		config: fetch_config,
	}

	return base
}

pub fn (c Conn) get_fetch_config() http.FetchConfig {
	mut fetch_config := http.FetchConfig {
		url: "https://database.deta.sh/v1/${c.project_id}"
	}

	fetch_config.header.add_custom('Content-Type', 'application/json') or {
		return http.FetchConfig {}
	}
	fetch_config.header.add_custom('x-api-key', c.project_key) or {
		return http.FetchConfig {}
	}

	return fetch_config
}
