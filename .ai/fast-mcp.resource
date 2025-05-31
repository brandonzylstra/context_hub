├── CHANGELOG.md
├── README.md
├── docs
    ├── configuring_mcp_clients.md
    ├── filtering.md
    ├── integration_guide.md
    ├── rails_integration.md
    ├── resources.md
    ├── security.md
    ├── sinatra_integration.md
    └── tools.md

/CHANGELOG.md:
--------------------------------------------------------------------------------
 1 | # Changelog
 2 |
 3 | All notable changes to this project will be documented in this file.
 4 |
 5 | The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
 6 | and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
 7 |
 8 | ## [1.4.0] - 2025-05-10
 9 | ### Added
10 | - Conditionnally hidden properties for tool calls (#70) [#70 @yjacquin](https://github.com/yjacquin/fast-mcp/pull/70)
11 | - Metadata to tool call results (#69) [#69 @yjacquin](https://github.com/yjacquin/fast-mcp/pull/69)
12 | - Link to official Discord Server in README.md
13 |
14 | ## [1.3.2] - 2025-05-08
15 | ### Changed
16 | - Logs are now less verbose by default [#64 @yjacquin](https://github.com/yjacquin/fast-mcp/pull/64)
17 | ### Fixed
18 | - Fix undefined method `call' for an instance of String error log [#61 @radwo](https://github.com/yjacquin/fast-mcp/pull/61)
19 |
20 | ## [1.3.1] - 2025-04-30
21 | ### Fixed
22 | -  Allow ipv4 mapped to ipv6 (#56) [#56 @josevalim](https://github.com/yjacquin/fast-mcp/pull/56)
23 | -  Add items to array (#55) [#55 @josevalim](https://github.com/yjacquin/fast-mcp/pull/56)
24 | -  Ping is a regular message event (#54) [#56 @josevalim](https://github.com/yjacquin/fast-mcp/pull/56)
25 |
26 | ## [1.3.0] - 2025-04-28
27 | ### Added
28 | - Added automatic forwarding of query params from to the messages endpoint [@yjacquin](https://github.com/yjacquin/fast-mcp/commit/011d968ac982d0b0084f7753dcac5789f66339ee)
29 |
30 | ### Fixed
31 | - Declare rack as an explicit dependency [#49 @subelsky](https://github.com/yjacquin/fast-mcp/pull/49)
32 | - Fix notifications/initialized response [#51 @yjacquin](https://github.com/yjacquin/fast-mcp/pull/51)
33 |
34 | ## [1.2.0] - 2025-04-21
35 | ### Added
36 | - Security enhancement: Bing only to localhost by default [#44 @yjacquin](https://github.com/yjacquin/fast-mcp/pull/44)
37 | - Prevent AuthenticatedRackMiddleware from blocking other rails routes[#35 @JulianPasquale](https://github.com/yjacquin/fast-mcp/pull/35)
38 | - Stop Forcing reconnections after 30 pings [#42 @zoedsoupe](https://github.com/yjacquin/fast-mcp/pull/42)
39 |
40 |
41 | ## [1.1.0] - 2025-04-13
42 | ### Added
43 | - Security enhancement: Added DNS rebinding protection by validating Origin headers [#32 @yjacquin](https://github.com/yjacquin/fast-mcp/pull/32/files)
44 | - Added configuration options for allowed origins in rack middleware [#32 @yjacquin](https://github.com/yjacquin/fast-mcp/pull/32/files)
45 | - Allow to change the SSE and Messages route [#23 @pedrofurtado](https://github.com/yjacquin/fast-mcp/pull/23)
46 | - Fix invalid return value when processing notifications/initialized request [#31 @abMatGit](https://github.com/yjacquin/fast-mcp/pull/31)
47 |
48 |
49 | ## [1.0.0] - 2025-03-30
50 |
51 | ### Added
52 | - Rails integration improvements via enhanced Railtie support
53 | - Automatic tool and resource registration in Rails applications
54 | - Extended Rails autoload paths for tools and resources directories
55 | - Sample generator templates for resources and tools
56 | - MCP Client configuration documentation as reported by [#8 @sivag-csod](https://github.com/yjacquin/fast-mcp/issues/8)
57 | - Example Ruby on Rails app in the documentation
58 | - `FastMcp.server` now exposes the MCP server to apps that may need it to access resources
59 | - Automated Github Releases through Github Workflow
60 |
61 | ### Fixed
62 | - Fixed bug with Rack middlewares not being initialized properly.
63 | - Fixed bug with STDIO logging preventing a proper connection with clients [# 11 @cs3b](https://github.com/yjacquin/fast-mcp/issues/11)
64 | - Fixed Rails SSE streaming detection and handling
65 | - Improved error handling in client reconnection scenarios
66 | - Namespace consistency correction (FastMCP -> FastMcp) throughout the codebase
67 |
68 | ### Improved
69 | - ⚠️ [Breaking] Resource content declaration changes
70 |   - Now resources implement `content` over `default_content`
71 |   - `content` is dynamically called when calling a resource, this implies we can declare dynamic resource contents like:
72 |   ```ruby
73 |   class HighestScoringUsersResource < FastMcp::Resource
74 |   ...
75 |     def content
76 |       User.order(score: :desc).last(5).map(&:as_json)
77 |     end
78 |   end
79 |   ```
80 | - More robust SSE connection lifecycle management
81 | - Optimized test suite with faster execution times
82 | - Better logging for debugging connection issues
83 | - Documentation had outdated examples
84 |
85 | ## [0.1.0] - 2025-03-12
86 |
87 | ### Added
88 |
89 | - Initial release of the Fast MCP library
90 | - FastMcp::Tool class with multiple definition styles
91 | - FastMcp::Server class with STDIO transport and HTTP / SSE transport
92 | - Rack Integration with authenticated and standard middleware options
93 | - Resource management with subscription capabilities
94 | - Binary resource support
95 | - Examples with STDIO Transport, HTTP & SSE, Rack app
96 | - Initialize lifecycle with capabilities
97 | - Comprehensive test suite with RSpec
98 |


--------------------------------------------------------------------------------
/README.md:
--------------------------------------------------------------------------------
  1 | # Fast MCP 🚀
  2 |
  3 | <div align="center">
  4 |   <h3>Connect AI models to your Ruby applications with ease</h3>
  5 |   <p>No complex protocols, no integration headaches, no compatibility issues – just beautiful, expressive Ruby code.</p>
  6 | </div>
  7 |
  8 | <p align="center">
  9 |   <a href="https://badge.fury.io/rb/fast-mcp"><img src="https://badge.fury.io/rb/fast-mcp.svg" alt="Gem Version" /></a>
 10 |   <a href="https://github.com/yjacquin/fast-mcp/workflows/CI/badge.svg"><img src="https://github.com/yjacquin/fast-mcp/workflows/CI/badge.svg" alt="CI Status" /></a>
 11 |   <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT" /></a>
 12 |   <a href="code_of_conduct.md"><img src="https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg" alt="Contributor Covenant" /></a>
 13 |   <a href="https://discord.gg/9HHfAtY3HF"><img src = "https://dcbadge.limes.pink/api/server/https://discord.gg/9HHfAtY3HF?style=flat" alt="Discord invite link" /></a>
 14 | </p>
 15 |
 16 | ## 🌟 Interface your Servers with LLMs in minutes !
 17 |
 18 | AI models are powerful, but they need to interact with your applications to be truly useful. Traditional approaches mean wrestling with:
 19 |
 20 | - 🔄 Complex communication protocols and custom JSON formats
 21 | - 🔌 Integration challenges with different model providers
 22 | - 🧩 Compatibility issues between your app and AI tools
 23 | - 🧠 Managing the state between AI interactions and your data
 24 |
 25 | Fast MCP solves all these problems by providing a clean, Ruby-focused implementation of the [Model Context Protocol](https://github.com/modelcontextprotocol), making AI integration a joy, not a chore.
 26 |
 27 | ## ✨ Features
 28 |
 29 | - 🛠️ **Tools API** - Let AI models call your Ruby functions securely, with in-depth argument validation through [Dry-Schema](https://github.com/dry-rb/dry-schema).
 30 | - 📚 **Resources API** - Share data between your app and AI models
 31 | - 🔄 **Multiple Transports** - Choose from STDIO, HTTP, or SSE based on your needs
 32 | - 🧩 **Framework Integration** - Works seamlessly with Rails, Sinatra or any Rack app.
 33 | - 🔒 **Authentication Support** - Secure your AI-powered endpoints with ease
 34 | - 🚀 **Real-time Updates** - Subscribe to changes for interactive applications
 35 | - 🎯 **Dynamic Filtering** - Control tool/resource access based on request context (permissions, API versions, etc.)
 36 |
 37 |
 38 | ## 💎 What Makes FastMCP Great
 39 | ```ruby
 40 | # Define tools for AI models to use
 41 | server = FastMcp::Server.new(name: 'popular-users', version: '1.0.0')
 42 |
 43 | # Define a tool by inheriting from FastMcp::Tool
 44 | class CreateUserTool < FastMcp::Tool
 45 |   description "Create a user"
 46 |     # These arguments will generate the needed JSON to be presented to the MCP Client
 47 |     # And they will be validated at run time.
 48 |     # The validation is based off Dry-Schema, with the addition of the description.
 49 |   arguments do
 50 |     required(:first_name).filled(:string).description("First name of the user")
 51 |     optional(:age).filled(:integer).description("Age of the user")
 52 |     required(:address).hash do
 53 |       optional(:street).filled(:string)
 54 |       optional(:city).filled(:string)
 55 |       optional(:zipcode).filled(:string)
 56 |     end
 57 |   end
 58 |
 59 |   def call(first_name:, age: nil, address: {})
 60 |     User.create!(first_name:, age:, address:)
 61 |   end
 62 | end
 63 |
 64 | # Register the tool with the server
 65 | server.register_tool(CreateUserTool)
 66 |
 67 | # Share data resources with AI models by inheriting from FastMcp::Resource
 68 | class PopularUsers < FastMcp::Resource
 69 |   uri "myapp:///users/popular"
 70 |   resource_name "Popular Users"
 71 |   mime_type "application/json"
 72 |
 73 |   def content
 74 |     JSON.generate(User.popular.limit(5).as_json)
 75 |   end
 76 | end
 77 |
 78 | class User < FastMcp::Resource
 79 |   uri "myapp:///users/{id}" # This is a resource template
 80 |   resource_name "user"
 81 |   mime_type "application/json"
 82 |
 83 |   def content
 84 |     id = params[:id] # params are computed from the uri pattern
 85 |
 86 |     JSON.generate(User.find(id).as_json)
 87 |   end
 88 | end
 89 |
 90 | # Register the resource with the server
 91 | server.register_resources(PopularUsers, User)
 92 |
 93 | # Accessing the resource through the server
 94 | server.read_resource(PopularUsers.uri)
 95 |
 96 | # Notify the resource content has been updated to clients
 97 | server.notify_resource_updated(PopularUsers.variabilized_uri)
 98 |
 99 | # Notifiy the content of a resource from a template has been updated to clients
100 | server.notify_resource_updated(User.variabilized_uri(id: 1))
101 | ```
102 |
103 | ### 🎯 Dynamic Tool Filtering
104 |
105 | Control which tools and resources are available based on request context:
106 |
107 | ```ruby
108 | # Tag your tools for easy filtering
109 | class AdminTool < FastMcp::Tool
110 |   tags :admin, :dangerous
111 |   description "Perform admin operations"
112 |
113 |   def call
114 |     # Admin only functionality
115 |   end
116 | end
117 |
118 | # Filter tools based on user permissions
119 | server.filter_tools do |request, tools|
120 |   user_role = request.params['role']
121 |
122 |   case user_role
123 |   when 'admin'
124 |     tools # Admins see all tools
125 |   when 'user'
126 |     tools.reject { |t| t.tags.include?(:admin) }
127 |   else
128 |     tools.select { |t| t.tags.include?(:public) }
129 |   end
130 | end
131 | ```
132 |
133 | ### 🚂 Fast Ruby on Rails implementation
134 | ```shell
135 | bundle add fast-mcp
136 | bin/rails generate fast_mcp:install
137 | ```
138 |
139 | This will add a configurable `fast_mcp.rb` initializer
140 |
141 | ```ruby
142 | require 'fast_mcp'
143 |
144 | FastMcp.mount_in_rails(
145 |   Rails.application,
146 |   name: Rails.application.class.module_parent_name.underscore.dasherize,
147 |   version: '1.0.0',
148 |   path_prefix: '/mcp', # This is the default path prefix
149 |   messages_route: 'messages', # This is the default route for the messages endpoint
150 |   sse_route: 'sse', # This is the default route for the SSE endpoint
151 |   # Add allowed origins below, it defaults to Rails.application.config.hosts
152 |   # allowed_origins: ['localhost', '127.0.0.1', 'example.com', /.*\.example\.com/],
153 |   # localhost_only: true, # Set to false to allow connections from other hosts
154 |   # whitelist specific ips to if you want to run on localhost and allow connections from other IPs
155 |   # allowed_ips: ['127.0.0.1', '::1']
156 |   # authenticate: true,       # Uncomment to enable authentication
157 |   # auth_token: 'your-token' # Required if authenticate: true
158 | ) do |server|
159 |   Rails.application.config.after_initialize do
160 |     # FastMcp will automatically discover and register:
161 |     # - All classes that inherit from ApplicationTool (which uses ActionTool::Base)
162 |     # - All classes that inherit from ApplicationResource (which uses ActionResource::Base)
163 |     server.register_tools(*ApplicationTool.descendants)
164 |     server.register_resources(*ApplicationResource.descendants)
165 |     # alternatively, you can register tools and resources manually:
166 |     # server.register_tool(MyTool)
167 |     # server.register_resource(MyResource)
168 |   end
169 | end
170 | ```
171 | The install script will also:
172 | - add app/resources folder
173 | - add app/tools folder
174 | - add app/tools/sample_tool.rb
175 | - add app/resources/sample_resource.rb
176 | - add ApplicationTool to inherit from
177 | - add ApplicationResource to inherit from as well
178 |
179 | #### Rails-friendly class naming conventions
180 |
181 | For Rails applications, FastMCP provides Rails-style class names to better fit with Rails conventions:
182 |
183 | - `ActionTool::Base` - An alias for `FastMcp::Tool`
184 | - `ActionResource::Base` - An alias for `FastMcp::Resource`
185 |
186 | These are automatically set up in Rails applications. You can use either naming convention in your code:
187 |
188 | ```ruby
189 | # Using Rails-style naming:
190 | class MyTool < ActionTool::Base
191 |   description "My awesome tool"
192 |
193 |   arguments do
194 |     required(:input).filled(:string)
195 |   end
196 |
197 |   def call(input:)
198 |     # Your implementation
199 |   end
200 | end
201 |
202 | # Using standard FastMcp naming:
203 | class AnotherTool < FastMcp::Tool
204 |   # Both styles work interchangeably in Rails apps
205 | end
206 | ```
207 |
208 | When creating new tools or resources, the generators will use the Rails naming convention by default:
209 |
210 | ```ruby
211 | # app/tools/application_tool.rb
212 | class ApplicationTool < ActionTool::Base
213 |   # Base methods for all tools
214 | end
215 |
216 | # app/resources/application_resource.rb
217 | class ApplicationResource < ActionResource::Base
218 |   # Base methods for all resources
219 | end
220 | ```
221 |
222 | ### Easy Sinatra setup
223 | I'll let you check out the dedicated [sinatra integration docs](./docs/sinatra_integration.md).
224 |
225 | ## 🚀 Quick Start
226 |
227 | ### Create a Server with Tools and Resources and STDIO transport
228 |
229 | ```ruby
230 | require 'fast_mcp'
231 |
232 | # Create an MCP server
233 | server = FastMcp::Server.new(name: 'my-ai-server', version: '1.0.0')
234 |
235 | # Define a tool by inheriting from FastMcp::Tool
236 | class SummarizeTool < FastMcp::Tool
237 |   description "Summarize a given text"
238 |
239 |   arguments do
240 |     required(:text).filled(:string).description("Text to summarize")
241 |     optional(:max_length).filled(:integer).description("Maximum length of summary")
242 |   end
243 |
244 |   def call(text:, max_length: 100)
245 |     # Your summarization logic here
246 |     text.split('.').first(3).join('.') + '...'
247 |   end
248 | end
249 |
250 | # Register the tool with the server
251 | server.register_tool(SummarizeTool)
252 |
253 | # Create a resource by inheriting from FastMcp::Resource
254 | class StatisticsResource < FastMcp::Resource
255 |   uri "data/statistics"
256 |   resource_name "Usage Statistics"
257 |   description "Current system statistics"
258 |   mime_type "application/json"
259 |
260 |   def content
261 |     JSON.generate({
262 |       users_online: 120,
263 |       queries_per_minute: 250,
264 |       popular_topics: ["Ruby", "AI", "WebDev"]
265 |     })
266 |   end
267 | end
268 |
269 | # Register the resource with the server
270 | server.register_resource(StatisticsResource)
271 |
272 | # Start the server
273 | server.start
274 | ```
275 |
276 | ## 🧪 Testing with the inspector
277 |
278 | MCP has developed a very [useful inspector](https://github.com/modelcontextprotocol/inspector).
279 | You can use it to validate your implementation. I suggest you use the examples I provided with this project as an easy boilerplate.
280 | Clone this project, then give it a go !
281 |
282 | ```shell
283 | npx @modelcontextprotocol/inspector examples/server_with_stdio_transport.rb
284 | ```
285 | Or to test with an SSE transport using a rack middleware:
286 | ```shell
287 | npx @modelcontextprotocol/inspector examples/rack_middleware.rb
288 | ```
289 |
290 | Or to test over SSE with an authenticated rack middleware:
291 | ```shell
292 | npx @modelcontextprotocol/inspector examples/authenticated_rack_middleware.rb
293 | ```
294 |
295 | You can test your custom implementation with the official MCP inspector by using:
296 | ```shell
297 | # Test with a stdio transport:
298 | npx @modelcontextprotocol/inspector path/to/your_ruby_file.rb
299 |
300 | # Test with an HTTP / SSE server. In the UI select SSE and input your address.
301 | npx @modelcontextprotocol/inspector
302 | ```
303 |
304 | #### Sinatra
305 |
306 | ```ruby
307 | # app.rb
308 | require 'sinatra'
309 | require 'fast_mcp'
310 |
311 | use FastMcp::RackMiddleware.new(name: 'my-ai-server', version: '1.0.0') do |server|
312 |   # Register tools and resources here
313 |   server.register_tool(SummarizeTool)
314 | end
315 |
316 | get '/' do
317 |   'Hello World!'
318 | end
319 | ```
320 |
321 | ### Integrating with Claude Desktop
322 |
323 | Add your server to your Claude Desktop configuration at:
324 | - macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
325 | - Windows: `%APPDATA%\Claude\claude_desktop_config.json`
326 |
327 | ```json
328 | {
329 |   "mcpServers": {
330 |     "my-great-server": {
331 |       "command": "ruby",
332 |       "args": [
333 |         "/Users/path/to/your/awesome/fast-mcp/server.rb"
334 |       ]
335 |     }
336 |   }
337 | }
338 | ```
339 |
340 | ## How to add a MCP server to Claude, Cursor, or other MCP clients?
341 | Please refer to [configuring_mcp_clients](docs/configuring_mcp_clients.md)
342 |
343 | ## 📊 Supported Specifications
344 |
345 | | Feature | Status |
346 | |---------|--------|
347 | | ✅ **JSON-RPC 2.0** | Full implementation for communication |
348 | | ✅ **Tool Definition & Calling** | Define and call tools with rich argument types |
349 | | ✅ **Resource & Resource Templates Management** | Create, read, update, and subscribe to resources |
350 | | ✅ **Transport Options** | STDIO, HTTP, and SSE for flexible integration |
351 | | ✅ **Framework Integration** | Rails, Sinatra, Hanami, and any Rack-compatible framework |
352 | | ✅ **Authentication** | Secure your AI endpoints with token authentication |
353 | | ✅ **Schema Support** | Full JSON Schema for tool arguments with validation |
354 |
355 | ## 🗺️ Use Cases
356 |
357 | - 🤖 **AI-powered Applications**: Connect LLMs to your Ruby app's functionality
358 | - 📊 **Real-time Dashboards**: Build dashboards with live AI-generated insights
359 | - 🔗 **Microservice Communication**: Use MCP as a clean protocol between services
360 | - 📚 **Interactive Documentation**: Create AI-enhanced API documentation
361 | - 💬 **Chatbots and Assistants**: Build AI assistants with access to your app's data
362 |
363 | ## 🔒 Security Features
364 |
365 | Fast MCP includes built-in security features to protect your applications:
366 |
367 | ### DNS Rebinding Protection
368 |
369 | The HTTP/SSE transport validates the Origin header on all incoming connections to prevent DNS rebinding attacks, which could allow malicious websites to interact with local MCP servers.
370 |
371 | ```ruby
372 | # Configure allowed origins (defaults to ['localhost', '127.0.0.1'])
373 | FastMcp.rack_middleware(app,
374 |   allowed_origins: ['localhost', '127.0.0.1', 'your-domain.com', /.*\.your-domain\.com/],
375 |   localhost_only: false,
376 |   allowed_ips: ['192.168.1.1', '10.0.0.1'],
377 |   # other options...
378 | )
379 | ```
380 |
381 | ### Authentication
382 |
383 | Fast MCP supports token-based authentication for all connections:
384 |
385 | ```ruby
386 | # Enable authentication
387 | FastMcp.authenticated_rack_middleware(app,
388 |   auth_token: 'your-secret-token',
389 |   # other options...
390 | )
391 | ```
392 |
393 | ## 📖 Documentation
394 |
395 | - [🚀 Getting Started Guide](docs/getting_started.md)
396 | - [🧩 Integration Guide](docs/integration_guide.md)
397 | - [🛤️ Rails Integration](docs/rails_integration.md)
398 | - [🌐 Sinatra Integration](docs/sinatra_integration.md)
399 | - [📚 Resources](docs/resources.md)
400 | - [🛠️ Tools](docs/tools.md)
401 | - [🔒 Security](docs/security.md)
402 | - [🎯 Dynamic Filtering](docs/filtering.md)
403 |
404 | ## 💻 Examples
405 |
406 | Check out the [examples directory](examples) for more detailed examples:
407 |
408 | - **🔨 Basic Examples**:
409 |   - [Simple Server](examples/server_with_stdio_transport.rb)
410 |   - [Tool Examples](examples/tool_examples.rb)
411 |
412 | - **🌐 Web Integration**:
413 |   - [Rack Middleware](examples/rack_middleware.rb)
414 |   - [Authenticated Endpoints](examples/authenticated_rack_middleware.rb)
415 |
416 | ## 🧪 Requirements
417 |
418 | - Ruby 3.2+
419 |
420 | ## 👥 Contributing
421 |
422 | We welcome contributions to Fast MCP! Here's how you can help:
423 |
424 | 1. Fork the repository
425 | 2. Create your feature branch (`git checkout -b my-new-feature`)
426 | 3. Commit your changes (`git commit -am 'Add some feature'`)
427 | 4. Push to the branch (`git push origin my-new-feature`)
428 | 5. Create a new Pull Request
429 |
430 | Please read our [Contributing Guide](CONTRIBUTING.md) for more details.
431 |
432 | ## 📄 License
433 |
434 | This project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
435 |
436 | ## 🙏 Acknowledgments
437 |
438 | - The [Model Context Protocol](https://github.com/modelcontextprotocol) team for creating the specification
439 | - The [Dry-Schema](https://github.com/dry-rb/dry-schema) team for the argument validation.
440 | - All contributors to this project
441 |


--------------------------------------------------------------------------------
/docs/configuring_mcp_clients.md:
--------------------------------------------------------------------------------
 1 | ## Claude Desktop
 2 | Edit claude_desktop_config.json
 3 |
 4 | ### STDIO
 5 | For stdio transports, we should first install the gem globally
 6 | `gem install fast-mcp`
 7 | Then, use the absolute path to your ruby install for the `command` as well as for the file path in `args`.
 8 |
 9 | ```json
10 | {
11 |   "mcpServers": {
12 |     "fast-mcp": {
13 |       // Add the absolute path to your ruby install, for instance
14 |       "command": "/Users/username/.rbenv/shims/ruby",
15 |       "args": [
16 |         // You can also clone this repo and use examples/server_with_stdio_transport.rb
17 |         "/Users/username/path/to/your_fast_mcp_server_with_stdio_transport.rb"
18 |       ]
19 |     }
20 |   }
21 | }
22 | ```
23 |
24 | ### HTTP & SSE
25 | ❌ Unfortunately, as of writing this, Anthropic hasn't released support for remote hosts and only acccept STDIO transports.
26 |
27 |
28 | ## Cursor
29 | In MacOS, Edit ~/.cursor/mcp.json
30 |
31 | ### STDIO
32 | ```json
33 | {
34 |   "mcpServers": {
35 |     "server-name": {
36 |       // Add the absolute path to your ruby install, for instance
37 |       "command": "/Users/username/.rbenv/shims/ruby",
38 |       // You can also clone this repo and use examples/server_with_stdio_transport.rb
39 |       "args": ["/Users/username/path/to/your_fast_mcp_server_with_stdio_transport.rb"]
40 |     }
41 |   }
42 | }
43 | ```
44 |
45 | ### HTTP & SSE
46 |
47 | ```json
48 | {
49 |   "mcpServers": {
50 |     "server-name": {
51 |       // You need to input the url to your SSE endpoint
52 |       "url": "http://localhost:3000/mcp/sse"
53 |     }
54 |   }
55 | }
56 | ```
57 |
58 | ## Zed
59 |
60 | ### STDIO
61 |
62 | ```json
63 | {
64 |   "context_servers": {
65 |     "server-name": {
66 |       "command": {
67 |         // Add the absolute path to your ruby install, for instance
68 |         "path": "/Users/username/.rbenv/shims/ruby",
69 |         // You can also clone this repo and use examples/server_with_stdio_transport.rb
70 |         "args": ["/Users/username/path/to/your_fast_mcp_server_with_stdio_transport.rb"]
71 |       }
72 |     }
73 |   }
74 | }
75 | ```
76 |
77 | ### HTTP & SSE
78 |
79 | Zed doesn't have native SSE support but you can use a proxy such as [mcp-proxy-rust](https://github.com/tidewave-ai/mcp_proxy_rust).
80 |
81 | ```json
82 | {
83 |   "context_servers": {
84 |     "server-name": {
85 |       "command": {
86 |         // if mcp-proxy is in your $PATH then there's no need to provide a full path
87 |         "path": "/path/to/mcp-proxy",
88 |         "args": ["http://localhost:3000/mcp/sse"],
89 |       }
90 |     }
91 |   }
92 | }
93 | ```
94 |


--------------------------------------------------------------------------------
/docs/filtering.md:
--------------------------------------------------------------------------------
  1 | # Dynamic Tool and Resource Filtering
  2 |
  3 | Fast MCP provides a powerful filtering system that allows you to dynamically control which tools and resources are available based on request context. This is useful for implementing:
  4 |
  5 | - Permission-based access control
  6 | - API versioning
  7 | - Feature flags
  8 | - Multi-tenancy
  9 | - Environment-specific functionality
 10 | - Rate limiting
 11 |
 12 | ## Table of Contents
 13 |
 14 | - [Overview](#overview)
 15 | - [Basic Usage](#basic-usage)
 16 | - [Tool Tagging](#tool-tagging)
 17 | - [Filter Functions](#filter-functions)
 18 | - [Advanced Usage](#advanced-usage)
 19 | - [Thread Safety](#thread-safety)
 20 | - [Examples](#examples)
 21 | - [Best Practices](#best-practices)
 22 |
 23 | ## Overview
 24 |
 25 | The filtering system works by:
 26 |
 27 | 1. Defining filters on the server that examine request context
 28 | 2. Creating request-scoped server instances with filtered tools/resources
 29 | 3. Using these filtered servers to handle specific requests
 30 |
 31 | This approach is completely thread-safe as each request gets its own server instance with the appropriate tools and resources.
 32 |
 33 | ## Basic Usage
 34 |
 35 | ### Adding a Simple Filter
 36 |
 37 | ```ruby
 38 | FastMcp.mount_in_rails(app) do |server|
 39 |   # Register all tools
 40 |   server.register_tools(AdminTool, UserTool, PublicTool)
 41 |
 42 |   # Add a filter based on request parameters
 43 |   server.filter_tools do |request, tools|
 44 |     role = request.params['role']
 45 |
 46 |     case role
 47 |     when 'admin'
 48 |       tools # Admin sees all tools
 49 |     when 'user'
 50 |       tools.reject { |t| t.tags.include?(:admin) }
 51 |     else
 52 |       tools.select { |t| t.tags.include?(:public) }
 53 |     end
 54 |   end
 55 | end
 56 | ```
 57 |
 58 | ### Filtering Resources
 59 |
 60 | ```ruby
 61 | server.filter_resources do |request, resources|
 62 |   tenant_id = request.headers['X-Tenant-ID']
 63 |
 64 |   # Only show resources for the current tenant
 65 |   resources.select { |r| r.tenant_id == tenant_id }
 66 | end
 67 | ```
 68 |
 69 | ## Tool Tagging
 70 |
 71 | Tools can be tagged for easier filtering:
 72 |
 73 | ```ruby
 74 | class DangerousTool < FastMcp::Tool
 75 |   tool_name 'delete_all'
 76 |   description 'Delete all data'
 77 |   tags :admin, :dangerous, :write
 78 |
 79 |   def call
 80 |     # Dangerous operation
 81 |   end
 82 | end
 83 |
 84 | class ReadOnlyTool < FastMcp::Tool
 85 |   tool_name 'list_users'
 86 |   description 'List all users'
 87 |   tags :read, :safe
 88 |
 89 |   def call
 90 |     # Safe read operation
 91 |   end
 92 | end
 93 | ```
 94 |
 95 | Tools can also have metadata:
 96 |
 97 | ```ruby
 98 | class ReportingTool < FastMcp::Tool
 99 |   tool_name 'generate_report'
100 |   description 'Generate a report'
101 |
102 |   metadata :category, 'reporting'
103 |   metadata :cpu_intensive, true
104 |   metadata :requires_license, 'enterprise'
105 |
106 |   def call
107 |     # Generate report
108 |   end
109 | end
110 | ```
111 |
112 | ## Filter Functions
113 |
114 | Filter functions receive two parameters:
115 | - `request`: A Rack::Request object with access to params, headers, etc.
116 | - `tools` or `resources`: An array of available tools/resources
117 |
118 | They should return a filtered array.
119 |
120 | ### Multiple Filters
121 |
122 | Filters are applied in sequence:
123 |
124 | ```ruby
125 | # First filter: Remove dangerous tools in production
126 | server.filter_tools do |request, tools|
127 |   if Rails.env.production?
128 |     tools.reject { |t| t.tags.include?(:dangerous) }
129 |   else
130 |     tools
131 |   end
132 | end
133 |
134 | # Second filter: Apply role-based access
135 | server.filter_tools do |request, tools|
136 |   role = request.params['role']
137 |   role == 'admin' ? tools : tools.reject { |t| t.tags.include?(:admin) }
138 | end
139 | ```
140 |
141 | ### Header-Based Filtering
142 |
143 | ```ruby
144 | server.filter_tools do |request, tools|
145 |   api_version = request.env['HTTP_X_API_VERSION']
146 |
147 |   case api_version
148 |   when 'v2'
149 |     tools # All tools available in v2
150 |   when 'v1'
151 |     tools.reject { |t| t.tags.include?(:v2_only) }
152 |   else
153 |     [] # No tools for unversioned requests
154 |   end
155 | end
156 | ```
157 |
158 | ## Advanced Usage
159 |
160 | ### Custom Server in Environment
161 |
162 | For advanced use cases, you can provide a custom server instance via the environment:
163 |
164 | ```ruby
165 | # In a middleware or controller
166 | env['fast_mcp.server'] = custom_filtered_server
167 | ```
168 |
169 | This takes precedence over any configured filters.
170 |
171 | ### Caching
172 |
173 | The RackTransport automatically caches filtered server instances based on request parameters to improve performance. Identical requests will reuse the same filtered server instance.
174 |
175 | ### Combining with Authentication
176 |
177 | ```ruby
178 | server.filter_tools do |request, tools|
179 |   # Get user from your authentication system
180 |   user = authenticate_request(request)
181 |
182 |   return [] unless user # No tools for unauthenticated requests
183 |
184 |   # Filter based on user permissions
185 |   tools.select { |t| user.can_access_tool?(t) }
186 | end
187 | ```
188 |
189 | ## Thread Safety
190 |
191 | The filtering system is designed to be completely thread-safe:
192 |
193 | - Each request gets its own server instance
194 | - No shared state is modified
195 | - Original server configuration remains unchanged
196 | - Concurrent requests with different filters work correctly
197 |
198 | ## Examples
199 |
200 | ### Permission-Based Access Control
201 |
202 | ```ruby
203 | class AdminTool < FastMcp::Tool
204 |   tags :admin
205 |   description "Administrative functions"
206 |
207 |   def call
208 |     "Admin action performed"
209 |   end
210 | end
211 |
212 | class UserTool < FastMcp::Tool
213 |   tags :user
214 |   description "User functions"
215 |
216 |   def call
217 |     "User action performed"
218 |   end
219 | end
220 |
221 | server.filter_tools do |request, tools|
222 |   user_role = request.headers['X-User-Role']
223 |
224 |   case user_role
225 |   when 'admin'
226 |     tools
227 |   when 'user'
228 |     tools.reject { |t| t.tags.include?(:admin) }
229 |   else
230 |     []
231 |   end
232 | end
233 | ```
234 |
235 | ### Feature Flags
236 |
237 | ```ruby
238 | server.filter_tools do |request, tools|
239 |   user_id = request.headers['X-User-ID']
240 |   enabled_features = FeatureFlags.for_user(user_id)
241 |
242 |   tools.reject do |tool|
243 |     tool.metadata(:feature_flag) &&
244 |     !enabled_features.include?(tool.metadata(:feature_flag))
245 |   end
246 | end
247 | ```
248 |
249 | ### Rate Limiting
250 |
251 | ```ruby
252 | server.filter_tools do |request, tools|
253 |   client_ip = request.ip
254 |
255 |   if RateLimiter.exceeded?(client_ip, :expensive_operations)
256 |     tools.reject { |t| t.metadata(:expensive) }
257 |   else
258 |     tools
259 |   end
260 | end
261 | ```
262 |
263 | ## Best Practices
264 |
265 | 1. **Keep Filters Fast**: Filters run on every request, so keep them efficient
266 | 2. **Use Tags Wisely**: Create a consistent tagging system across your tools
267 | 3. **Cache When Possible**: The built-in caching helps, but consider caching expensive checks
268 | 4. **Fail Secure**: When in doubt, exclude tools rather than include them
269 | 5. **Log Filter Actions**: Consider logging when tools are filtered for debugging
270 | 6. **Test Thoroughly**: Write tests for your filter logic to ensure security
271 |
272 | ## Migration from Custom Solutions
273 |
274 | If you have existing middleware that modifies tool availability, you can migrate to the filtering system:
275 |
276 | ```ruby
277 | # Before: Custom middleware
278 | class ToolFilterMiddleware
279 |   def call(env)
280 |     # Complex logic to modify server tools
281 |   end
282 | end
283 |
284 | # After: Using filter_tools
285 | server.filter_tools do |request, tools|
286 |   # Same logic, but cleaner and thread-safe
287 | end
288 | ```
289 |
290 | The filtering system handles all the complexity of creating request-scoped servers and ensuring thread safety.


--------------------------------------------------------------------------------
/docs/integration_guide.md:
--------------------------------------------------------------------------------
  1 | # Integrating MCP with Web Applications
  2 |
  3 | This guide explains how to integrate the Model Context Protocol (MCP) with your web application using the Fast MCP library. The library supports both standalone operation and integration with existing web frameworks.
  4 |
  5 | ## Installation
  6 |
  7 | Add the Fast MCP gem to your application's Gemfile:
  8 |
  9 | ```ruby
 10 | gem 'fast-mcp'
 11 | ```
 12 |
 13 | Then run:
 14 |
 15 | ```bash
 16 | bundle install
 17 | ```
 18 |
 19 | ## Integration Approaches
 20 |
 21 | Fast MCP supports two main integration approaches:
 22 |
 23 | 1. **Standalone Server**: Running MCP as a separate process, communicating via STDIO.
 24 | 2. **Rack Middleware**: Embedding MCP directly in your web application as a Rack middleware.
 25 |
 26 | ## Standalone Server Approach
 27 |
 28 | The standalone approach runs the MCP server as a separate process:
 29 |
 30 | ```ruby
 31 | #!/usr/bin/env ruby
 32 | # mcp_server.rb
 33 |
 34 | require 'fast_mcp'
 35 |
 36 | # Create the server
 37 | server = FastMcp::Server.new(name: 'my-mcp-server', version: '1.0.0')
 38 |
 39 | # Define tools
 40 | class ExampleTool < Mcp::Tool
 41 |   description "An example tool"
 42 |   arguments do
 43 |    required(:input).filled(:string).description("Input value")
 44 |   end
 45 |
 46 |   def call(input:)
 47 |     "You provided: #{input}"
 48 |   end
 49 | end
 50 |
 51 | class HelloWorld < FastMcp::Resource
 52 |   uri "example/counter.txt"
 53 |   name "Counter"
 54 |   description "A simple Hello World resource"
 55 |   mime_type "application/txt"
 56 |
 57 |   def content
 58 |     "Hello, World!"
 59 |   end
 60 | end
 61 | # register the tool
 62 | server.register_tool(ExampleTool)
 63 | # Register the resource
 64 | server.register_resource(HelloWorld)
 65 |
 66 | # Start the server
 67 | server.start
 68 | ```
 69 |
 70 | Then, in your application, you can connect to this server:
 71 |
 72 |
 73 | ### Advantages of the Standalone Approach
 74 |
 75 | - **Isolation**: The MCP server runs in a separate process, providing better isolation.
 76 | - **Independent Scaling**: You can scale the MCP server independently of your main application.
 77 | - **Fault Tolerance**: If the MCP server crashes, it doesn't affect your main application.
 78 |
 79 | ### Disadvantages of the Standalone Approach
 80 |
 81 | - **Operational Complexity**: You need to manage an additional process.
 82 | - **Communication Overhead**: Inter-process communication adds some overhead.
 83 |
 84 | ## Rack Middleware Approach
 85 |
 86 | The Rack middleware approach embeds the MCP server directly in your web application:
 87 |
 88 | ```ruby
 89 | require 'fast_mcp'
 90 |
 91 | class ExampleTool < Mcp::Tool
 92 |   description "An example tool"
 93 |   arguments do
 94 |    required(:input).filled(:string).description("Input value")
 95 |   end
 96 |
 97 |   def call(input:)
 98 |     "You provided: #{input}"
 99 |   end
100 | end
101 |
102 | class HelloWorld < FastMcp::Resource
103 |   uri "example/counter.txt"
104 |   name "Counter"
105 |   description "A simple Hello World resource"
106 |   mime_type "application/txt"
107 |
108 |   def content
109 |     "Hello, World!"
110 |   end
111 | end
112 |
113 | # Create the middleware
114 | mcp_middleware = FastMcp.rack_middleware(app, name: 'my-mcp-server', version: '1.0.0' do |server|
115 |   # Define your tools here
116 |   server.register_tool(ExampleTool)
117 |   server.register_resource(HelloWorld)
118 | end
119 |
120 | # alternatively, you can use an authenticated rack middleware to secure it with an API key
121 | mcp_middleware = FastMcp.rack_middleware(app, name: 'my-mcp-server', version: '1.0.0' do |server|
122 |   # Define your tools here
123 |   server.register_tool(ExampleTool)
124 |   server.register_resource(HelloWorld)
125 | end
126 |
127 | # Use the middleware
128 | use mcp_middleware
129 | ```
130 | Clients can then connect to this server using HTTP/SSE
131 |
132 | ### Advantages of the Rack Middleware Approach
133 |
134 | - **Simplicity**: No need to manage a separate process.
135 | - **Resource Sharing**: Share resources (e.g., database connections) with your main application.
136 | - **Authentication Integration**: Reuse your application's authentication mechanisms.
137 |
138 | ### Disadvantages of the Rack Middleware Approach
139 |
140 | - **Coupling**: Tightly couples your MCP implementation to your web framework.
141 | - **Resource Contention**: MCP operations might impact your main application's performance.
142 | - **Scaling Challenges**: May complicate scaling strategies if MCP and application have different scaling needs.
143 |
144 | ## Framework-Specific Integration
145 |
146 | For framework-specific integration guides, see:
147 |
148 | - [Rails Integration Guide](./rails_integration.md)
149 | - [Sinatra Integration Guide](./sinatra_integration.md)
150 |
151 | ## Authentication and Authorization
152 |
153 | Both integration approaches support authentication and authorization:
154 |
155 | ### Standalone Server Authentication
156 |
157 | For standalone servers, you can implement authentication by checking credentials before processing requests:
158 |
159 | ```ruby
160 | class ExampleTool < FastMcp::Tool
161 |   description "A secure tool that requires authentication"
162 |   arguments do
163 |     required(:api_key).filled(:string)description("API key for authentication")
164 |     required(:input).filled(:string).description("Input value")
165 |   end
166 |
167 |   def call(api_key:, input)
168 |     # Check the API key
169 |     unless api_key == ENV['API_KEY']
170 |       raise "Invalid API key"
171 |     end
172 |
173 |     # Process the request
174 |     { output: "You provided: #{input}" }
175 |   end
176 | end
177 | ```
178 |
179 | ## Working with Resources
180 |
181 | MCP Resources provide a way to share and synchronize data between the server and clients. Here's how to use them:
182 |
183 | ### Creating and Registering Resources
184 |
185 | ```ruby
186 | # Create a resource
187 | class Counter < FastMcp::Resource
188 |   uri "example/counter"
189 |   resource_name "Counter"
190 |   description "A simple counter resource"
191 |   mime_type "application/json"
192 |
193 |   def content
194 |     # Read from file or database, or generate dynamically
195 |     count = File.exist?('counter.txt') ? File.read('counter.txt').to_i : 0
196 |     JSON.generate({ count: count })
197 |   end
198 | end
199 |
200 | # Register the resource with the server
201 | server.register_resource(Counter)
202 | ```
203 |
204 | ### Updating Resources
205 |
206 | Since resources are stateless, updates are typically handled through tools:
207 |
208 | ```ruby
209 | # Example tool that updates the counter
210 | class IncrementCounterTool < FastMcp::Tool
211 |   description 'Increment the counter'
212 |
213 |   def call
214 |     # Read current value
215 |     current_count = File.exist?('counter.txt') ? File.read('counter.txt').to_i : 0
216 |
217 |     # Increment and save
218 |     new_count = current_count + 1
219 |     File.write('counter.txt', new_count.to_s)
220 |
221 |     # Notify that the resource has been updated
222 |     notify_resource_updated("example/counter")
223 |
224 |     { count: new_count }
225 |   end
226 | end
227 | ```
228 |
229 | ### Reading Resources from the Client
230 |
231 | ```ruby
232 | # Read a resource
233 | resource = client.read_resource("example/counter")
234 | counter_data = JSON.parse(resource[:content])
235 | puts "Counter value: #{counter_data['count']}"
236 | ```
237 |
238 | For more details on working with resources, see the [Resources documentation](./resources.md).
239 |
240 | ## Deployment Considerations
241 |
242 | When deploying your application with MCP integration, consider the following:
243 |
244 | ### For Standalone Servers
245 |
246 | 1. **Process Management**: Use a process manager (e.g., systemd, Docker) to ensure the MCP server stays running.
247 | 2. **Logging**: Configure proper logging for the MCP server.
248 | 3. **Monitoring**: Set up monitoring to detect if the MCP server becomes unresponsive.
249 | 4. **Resource Updates**: Consider the frequency of resource updates and their impact on performance.
250 |
251 | ### For Rack Middleware
252 |
253 | 1. **Server Requirements**: Ensure your web server supports SSE for real-time communication.
254 | 2. **Load Balancing**: Configure load balancers to handle SSE connections properly.
255 | 3. **Timeouts**: Set appropriate timeouts for SSE connections.
256 | 4. **Resource Synchronization**: In multi-process environments, ensure resource updates are synchronized across processes.
257 |
258 | ## Choosing the Right Approach
259 |
260 | The best approach depends on your specific requirements:
261 |
262 | - **Use the Standalone Approach if**:
263 |   - You need strong isolation between your application and MCP.
264 |   - You want to scale MCP independently.
265 |   - You're concerned about MCP operations affecting your main application's performance.
266 |   - You have resources that update very frequently.
267 |
268 | - **Use the Rack Middleware Approach if**:
269 |   - You want a simpler deployment.
270 |   - You need to share resources with your main application.
271 |   - You want to reuse your application's authentication mechanisms.
272 |   - Your resources don't update too frequently.
273 |
274 | For most applications, we recommend starting with the Rack middleware approach for simplicity, then moving to the standalone approach if you encounter performance or scaling issues.
275 |
276 | ## Next Steps
277 |
278 | - Check out the [examples directory](../examples) for more examples of using MCP.
279 | - Read the [Resources documentation](./resources.md) for more details on using MCP Resources.
280 | - Explore the [advanced configuration options](./advanced_configuration.md) for customizing MCP behavior.
281 |


--------------------------------------------------------------------------------
/docs/rails_integration.md:
--------------------------------------------------------------------------------
1 | # TODO
2 | In the meantime, check the README or the [demo rails app](../examples/rails-demo-app/)


--------------------------------------------------------------------------------
/docs/resources.md:
--------------------------------------------------------------------------------
  1 | # MCP Resources
  2 |
  3 | This guide explains how to use the Resources feature of the Model Context Protocol (MCP) with the Fast MCP library.
  4 |
  5 | ## What are MCP Resources?
  6 |
  7 | Resources in MCP are a way to share data between the server and clients. Unlike tools, which are used for executing actions, resources are used for sharing and synchronizing state. Resources can be:
  8 |
  9 | - Static data (like configuration)
 10 | - Dynamic data that changes over time (like user data)
 11 | - Binary content (like images or files)
 12 | - Streaming data that updates frequently (like sensor readings)
 13 |
 14 | Resources are identified by a unique URI and can be read, subscribed to, and updated.
 15 |
 16 | ## Resource Features
 17 |
 18 | The Fast MCP library supports the following resource features:
 19 |
 20 | - **Resource Registration**: Register resources with the server
 21 | - **Resource Reading**: Read resource content from the client
 22 | - **Resource Subscription**: Subscribe to resource updates
 23 | - **Resource Notifications**: Receive notifications when resources change
 24 | - **Binary Content**: Support for both text and binary content
 25 | - **Resource Metadata**: Access resource metadata without reading the content
 26 |
 27 | ## Server-Side Usage
 28 |
 29 | ### Creating and Registering Resources
 30 |
 31 | You can create resources by inheriting from the `FastMcp::Resource` class. Resources are stateless and generate content dynamically:
 32 |
 33 | ```ruby
 34 | require 'fast_mcp'
 35 |
 36 | # Create a server
 37 | server = FastMcp::Server.new(name: "my-mcp-server", version: "1.0.0")
 38 |
 39 | # Create a resource by inheriting from FastMcp::Resource
 40 | class CounterResource < FastMcp::Resource
 41 |   uri "example/counter"
 42 |   resource_name "Counter"
 43 |   description "A simple counter resource"
 44 |   mime_type "application/json"
 45 |
 46 |   def content
 47 |     # Read from file or database, or generate dynamically
 48 |     count = File.exist?('counter.txt') ? File.read('counter.txt').to_i : 0
 49 |     JSON.generate({ count: count })
 50 |   end
 51 | end
 52 |
 53 | # Register the resource with the server
 54 | server.register_resource(CounterResource)
 55 | ```
 56 |
 57 | ### Creating Resources from Files
 58 |
 59 | You can create resources from files:
 60 |
 61 | ```ruby
 62 | # Create a resource from a file
 63 | image_resource = FastMcp::Resource.from_file(
 64 |   "path/to/image.png",
 65 |   name: "Example Image",
 66 |   description: "An example image resource"
 67 | )
 68 |
 69 | # Register the resource with the server
 70 | server.register_resource(image_resource)
 71 | ```
 72 |
 73 | ### Updating Resources
 74 |
 75 | Since resources are stateless, updates are typically handled through tools that modify external state (files, databases, etc.) and then notify about resource changes:
 76 |
 77 | ```ruby
 78 | # Example tool that updates the counter
 79 | class IncrementCounterTool < FastMcp::Tool
 80 |   description 'Increment the counter'
 81 |
 82 |   def call
 83 |     # Read current value
 84 |     current_count = File.exist?('counter.txt') ? File.read('counter.txt').to_i : 0
 85 |
 86 |     # Increment and save
 87 |     new_count = current_count + 1
 88 |     File.write('counter.txt', new_count.to_s)
 89 |
 90 |     # Notify that the resource has been updated
 91 |     notify_resource_updated("example/counter")
 92 |
 93 |     { count: new_count }
 94 |   end
 95 | end
 96 | ```
 97 |
 98 | ### Removing Resources
 99 |
100 | You can remove resources from the server:
101 |
102 | ```ruby
103 | # Remove a resource
104 | server.remove_resource("example/counter")
105 | ```
106 |
107 | ## Custom Resource Types
108 |
109 | You can create custom resource types by inheriting from `FastMcp::Resource` and implementing the required methods. Resources should be stateless and read from external sources:
110 |
111 | ```ruby
112 | # Custom resource type for weather data
113 | class WeatherResource < FastMcp::Resource
114 |   uri "weather/current"
115 |   resource_name "Current Weather"
116 |   description "Current weather conditions"
117 |   mime_type "application/json"
118 |
119 |   def content
120 |     # Generate dynamic content or read from external source
121 |     JSON.generate({
122 |       temperature: rand(15..30),
123 |       condition: ['Sunny', 'Cloudy', 'Rainy'].sample,
124 |       humidity: rand(30..70),
125 |       wind_speed: rand(5..25),
126 |       updated_at: Time.now.to_s
127 |     })
128 |   end
129 | end
130 |
131 | # Register the resource
132 | server.register_resource(WeatherResource)
133 |
134 | # To update weather data, you would typically use a tool that
135 | # writes to a file or database, then notifies about the update
136 | ```
137 |
138 | This approach ensures that:
139 |
140 | 1. Resources are stateless and don't hold in-memory state
141 | 2. Content is generated dynamically from external sources
142 | 3. Multiple instances can be created without conflicts
143 | 4. Resources are more suitable for distributed environments
144 |
145 | ## Integration with Web Frameworks
146 |
147 | When integrating MCP resources with web frameworks like Rails, Sinatra, or Hanami, you can use the same approach as with tools. The resources will be exposed through the Rack middleware.
148 |
149 | For more details on integrating with web frameworks, see:
150 | - [Rails Integration Guide](./rails_integration.md)
151 | - [Sinatra Integration Guide](./sinatra_integration.md)
152 | - [Hanami Integration Guide](./hanami_integration.md)
153 |
154 | ## Best Practices
155 |
156 | 1. **Use Appropriate URIs**: Use descriptive, hierarchical URIs for your resources (e.g., "users/profiles/123").
157 |
158 | 2. **Set Correct MIME Types**: Always set the correct MIME type for your resources to ensure proper handling.
159 |
160 | 3. **Handle Binary Content Properly**: When dealing with binary content, be careful with encoding and decoding.
161 |
162 | 4. **Keep Resources Stateless**: Resources should not maintain in-memory state. Instead, read from files, databases, or other external sources.
163 |
164 | 5. **Use Tools for Updates**: Use MCP tools to modify external state and notify about resource changes.
165 |
166 | 6. **Error Handling**: Implement proper error handling for resource operations, especially when dealing with external data sources.
167 |
168 | 7. **Security**: Be mindful of what data you expose through resources, especially in multi-tenant applications.
169 |
170 | ## Conclusion
171 |
172 | MCP Resources provide a powerful way to share and synchronize data between servers and clients. By keeping resources stateless and using tools for updates, you can build robust, scalable applications that work well in distributed environments.


--------------------------------------------------------------------------------
/docs/security.md:
--------------------------------------------------------------------------------
  1 | # Security Features in Fast MCP
  2 |
  3 | Security is a critical aspect of any application that exposes functionality through APIs, especially when those APIs can be called by AI models or external clients. Fast MCP provides several security features to help protect your applications.
  4 |
  5 | ## Table of Contents
  6 |
  7 | - [DNS Rebinding Protection](#dns-rebinding-protection)
  8 | - [Authentication](#authentication)
  9 | - [HTTPS and SSL](#https-and-ssl)
 10 | - [Best Practices](#best-practices)
 11 |
 12 | ## DNS Rebinding Protection
 13 |
 14 | DNS rebinding attacks are a type of attack where a malicious website tricks a browser into sending requests to a local service by changing the DNS records after the page has loaded. This could allow attackers to interact with local MCP servers from remote websites.
 15 |
 16 | ### How Fast MCP Protects Against DNS Rebinding
 17 |
 18 | Fast MCP's HTTP/SSE transport validates the `Origin` header on all incoming connections to prevent DNS rebinding attacks. This ensures that only requests from trusted origins are processed.
 19 |
 20 | ### Configuration
 21 |
 22 | You can configure the allowed origins when creating the rack middleware:
 23 |
 24 | ```ruby
 25 | # Configure allowed origins (defaults to ['localhost', '127.0.0.1'])
 26 | FastMcp.rack_middleware(app,
 27 |   allowed_origins: [
 28 |     'localhost',
 29 |     '127.0.0.1',
 30 |     'your-domain.com',
 31 |     /.*\.your-domain\.com/  # Regex for subdomains
 32 |   ],
 33 |   # other options...
 34 | )
 35 | ```
 36 |
 37 | With the Rails integration, it defaults to `Rails.application.config.hosts`, but you can override this through the initializer:
 38 |
 39 | ```ruby
 40 | FastMcp.mount_in_rails(
 41 |   Rails.application,
 42 |   ...
 43 |   # Add allowed origins below, it defaults to Rails.application.config.hosts
 44 |   allowed_origins: ['example.com', /.*\.example\.com/],
 45 | ...
 46 | ) do |server|
 47 |   ...
 48 | end
 49 | ```
 50 | ```
 51 |
 52 | The `allowed_origins` parameter accepts an array of strings and regular expressions:
 53 | - Strings are matched exactly against the hostname in the Origin header
 54 | - Regular expressions are matched against the hostname for more flexible matching (e.g., for subdomains)
 55 |
 56 | ### Technical Implementation
 57 |
 58 | When a request arrives at the MCP endpoint, the RackTransport middleware:
 59 |
 60 | 1. Extracts the Origin header from the request
 61 | 2. Falls back to Referer or Host headers if Origin is not present
 62 | 3. Parses the hostname from the header value
 63 | 4. Checks if the hostname matches any of the allowed origins
 64 | 5. Returns a 403 Forbidden response if the hostname is not allowed
 65 |
 66 | ## Authentication
 67 |
 68 | Fast MCP supports token-based authentication for all connections to ensure only authorized clients can access your MCP server.
 69 |
 70 | ### Basic Authentication
 71 |
 72 | To enable authentication, use the `authenticated_rack_middleware` method:
 73 |
 74 | ```ruby
 75 | # Enable authentication
 76 | FastMcp.authenticated_rack_middleware(app,
 77 |   auth_token: 'your-secret-token',
 78 |   # other options...
 79 | )
 80 | ```
 81 |
 82 | ### Custom Authentication Headers
 83 |
 84 | You can configure the header name used for authentication:
 85 |
 86 | ```ruby
 87 | FastMcp.authenticated_rack_middleware(app,
 88 |   auth_token: 'your-secret-token',
 89 |   auth_header_name: 'X-API-Key',  # Default is 'Authorization'
 90 |   # other options...
 91 | )
 92 | ```
 93 |
 94 | ### Authentication Exemptions
 95 |
 96 | Some paths can be exempted from authentication:
 97 |
 98 | ```ruby
 99 | FastMcp.authenticated_rack_middleware(app,
100 |   auth_token: 'your-secret-token',
101 |   auth_exempt_paths: ['/health-check'],  # Paths that don't require authentication
102 |   # other options...
103 | )
104 | ```
105 |
106 | ## Best Practices
107 |
108 | Here are some best practices to enhance the security of your MCP server:
109 |
110 | 1. **Always validate Origin headers** (enabled by default)
111 | 2. **Use authentication** for all MCP endpoints in production
112 | 3. **Deploy behind HTTPS** in production environments
113 | 4. **Keep your auth_token secret** and rotate it regularly
114 | 5. **Implement proper error handling** to avoid leaking sensitive information
115 | 6. **Validate inputs thoroughly** in your tool implementations
116 | 7. **Implement rate limiting** for MCP endpoints to prevent abuse
117 | 8. **Follow the principle of least privilege** when implementing tools
118 | 9. **Log security events** to detect and respond to potential security incidents
119 |
120 | ## Additional Resources
121 |
122 | - [OWASP Top Ten](https://owasp.org/www-project-top-ten/) for general web application security guidance
123 | - [Ruby on Rails Security Guide](https://guides.rubyonrails.org/security.html) for Rails-specific security guidance
124 | - [Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP) for protecting against XSS attacks
125 |


--------------------------------------------------------------------------------
/docs/sinatra_integration.md:
--------------------------------------------------------------------------------
  1 | # Integrating MCP with Sinatra Applications
  2 |
  3 | This guide explains how to integrate the Model Context Protocol (MCP) with your Sinatra application using the Fast MCP library.
  4 |
  5 | ## Installation
  6 |
  7 | Add the Fast MCP gem to your application's Gemfile:
  8 |
  9 | ```ruby
 10 | gem 'fast-mcp'
 11 | ```
 12 |
 13 | Then run:
 14 |
 15 | ```bash
 16 | bundle install
 17 | ```
 18 |
 19 | ## Basic Integration
 20 |
 21 | Sinatra applications can integrate with MCP using the Rack middleware approach. This allows you to embed the MCP server directly in your Sinatra application.
 22 |
 23 | ### Using Rack Middleware
 24 |
 25 | Add the MCP middleware to your Sinatra application:
 26 |
 27 | ```ruby
 28 | # app.rb
 29 | require 'sinatra'
 30 | require 'fast_mcp'
 31 |
 32 | # Create the MCP server
 33 | mcp_server = FastMcp::Server.new(name: 'sinatra-mcp-server', version: '1.0.0')
 34 |
 35 | # Define your tools
 36 | class ExampleTool < Mcp::Tool
 37 |   description "An example tool"
 38 |   arguments  do
 39 |    required(:input).filled(:string).description("Input value")
 40 |   end
 41 |
 42 |   def call(input:)
 43 |     "You provided: #{input}"
 44 |   end
 45 | end
 46 |
 47 | # Register resources
 48 | class Counter < FastMcp::Resource
 49 |   uri "example/counter"
 50 |   resource_name "Counter",
 51 |   description "A simple counter resource"
 52 |   mime_type "application/json"
 53 |
 54 |   def initialize
 55 |     @count = 0
 56 |   end
 57 |
 58 |   attr_accessor :count
 59 |
 60 |   def content
 61 |     JSON.generate({ count: @count })
 62 |   end
 63 | end
 64 |
 65 |
 66 | # Use the MCP middleware
 67 | use FastMcp::Transports::RackTransport, server
 68 |
 69 | # Define your Sinatra routes
 70 | get '/' do
 71 |   'Hello, world!'
 72 | end
 73 | ```
 74 |
 75 |
 76 | ### Using Authenticated Rack Middleware
 77 |
 78 | Add the MCP authenticated rack middleware to your Sinatra application:
 79 |
 80 | ```ruby
 81 | # app.rb
 82 | require 'sinatra'
 83 | require 'fast_mcp'
 84 |
 85 | # Create the MCP server
 86 | mcp_server = FastMcp::Server.new(name: 'sinatra-mcp-server', version: '1.0.0')
 87 |
 88 | # Define your tools
 89 | class ExampleTool < Mcp::Tool
 90 |   description "An example tool"
 91 |   arguments  do
 92 |    required(:input).filled(:string).description("Input value")
 93 |   end
 94 |
 95 |   def call(input:)
 96 |     "You provided: #{input}"
 97 |   end
 98 | end
 99 |
100 | # Register resources
101 | class Counter < FastMcp::Resource
102 |   uri "example/counter"
103 |   resource_name "Counter",
104 |   description "A simple counter resource"
105 |   mime_type "application/json"
106 |
107 |   def initialize
108 |     @count = 0
109 |   end
110 |
111 |   attr_accessor :count
112 |
113 |   def content
114 |     JSON.generate({ count: @count })
115 |   end
116 | end
117 |
118 |
119 | # Use the MCP middleware
120 | use FastMcp::Transports::AuthenticatedRackTransport, server
121 |
122 | # Define your Sinatra routes
123 | get '/' do
124 |   'Hello, world!'
125 | end
126 | ```
127 |
128 | ### Alternative: Using a Configuration Block
129 |
130 | For more complex applications, you might prefer to use a configuration block:
131 |
132 | ```ruby
133 | # app.rb
134 | require 'sinatra'
135 | require 'fast_mcp'
136 |
137 | # Use the MCP middleware with a configuration block
138 | use FastMcp.rack_middleware, { name: 'sinatra-mcp-server', version: '1.0.0'} do |server|
139 |   # Define your tools, here with anonymous classes
140 |   tool = Class.new(Mcp::Tool) do
141 |     description "An example tool"
142 |     tool_name "Example"
143 |
144 |     arguments  do
145 |       required(:input).filled(:string).description("Input value")
146 |     end
147 |
148 |     def call(input:)
149 |       "You provided: #{input}"
150 |     end
151 |   end
152 |   server.register_tool(tool)
153 |
154 |   # Register resources
155 |   counter_resource = Class.new(FastMcp::Resource) do
156 |     uri "example/counter"
157 |     resource_name "Counter",
158 |     description "A simple counter resource"
159 |     mime_type "application/json"
160 |
161 |     def initialize
162 |       @count = 0
163 |     end
164 |
165 |     attr_accessor :count
166 |
167 |     def content
168 |       JSON.generate({ count: @count })
169 |     end
170 |   end
171 |
172 |   server.register_resource(counter_resource)
173 | end
174 |
175 | # Define your Sinatra routes
176 | get '/' do
177 |   'Hello, world!'
178 | end
179 | ```
180 |
181 | ## Advanced Integration
182 |
183 | ### Accessing Sinatra Helpers and Settings
184 |
185 | You can access Sinatra helpers and settings from your MCP tools and resources:
186 |
187 | ```ruby
188 | # app.rb
189 | require 'sinatra'
190 | require 'fast_mcp'
191 |
192 | # Define a helper method
193 | helpers do
194 |   def format_data(data)
195 |     # Format the data
196 |     data.upcase
197 |   end
198 | end
199 |
200 | # Set a setting
201 | set :api_key, ENV['API_KEY']
202 |
203 | # Use the MCP middleware
204 | use MCP.rack_middleware(name: 'sinatra-mcp-server', version: '1.0.0') do |server|
205 |   # Define a tool that uses Sinatra helpers and settings
206 |   class ProcessDataTool < Mcp::Tool
207 |     description "Process data using Sinatra helpers"
208 |     arguments do
209 |       required(:input).filled(:string).description("Input data")
210 |     end
211 |
212 |     def call(input:)
213 |       # Access Sinatra helpers and settings
214 |       api_key = settings.api_key
215 |       formatted_data = helpers.format_data(input)
216 |
217 |       # Return the result
218 |       { status: "success", result: formatted_data }
219 |     end
220 |   end
221 | end
222 | ```
223 |
224 | ### Accessing Database Models
225 |
226 | If you're using a database with Sinatra (e.g., ActiveRecord, Sequel), you can access your models from MCP tools and resources:
227 |
228 | ```ruby
229 | # app.rb
230 | require 'sinatra'
231 | require 'sinatra/activerecord'
232 | require 'fast_mcp'
233 |
234 | # Define your models
235 | class User < ActiveRecord::Base
236 |   # ...
237 | end
238 |
239 | # Use the MCP middleware
240 | use MCP.rack_middleware(name: 'sinatra-mcp-server', version: '1.0.0') do |server|
241 |   # Define a tool that uses ActiveRecord models
242 |   server.tool "search_users" do
243 |     description "Search for users by name"
244 |     argument :query, description: "Search query", type: :string, required: true
245 |
246 |     call do |args|
247 |       # Use ActiveRecord to search for users
248 |       users = User.where("name LIKE ?", "%#{args[:query]}%")
249 |
250 |       # Return the results
251 |       users.map { |user| { id: user.id, name: user.name, email: user.email } }
252 |     end
253 |   end
254 |
255 |   # Register a resource that uses ActiveRecord models
256 |   server.register_resource(FastMcp::Resource.new(
257 |     uri: "data/users",
258 |     name: "Users",
259 |     description: "List of all users",
260 |     mime_type: "application/json",
261 |     content: JSON.generate(User.all.map { |user| { id: user.id, name: user.name } })
262 |   ))
263 | end
264 | ```
265 |
266 | ### Dynamic Resource Updates
267 |
268 | You can update resources based on changes in your Sinatra application:
269 |
270 | ```ruby
271 | # app.rb
272 | require 'sinatra'
273 | require 'sinatra/activerecord'
274 | require 'fast_mcp'
275 |
276 | # Define your models
277 | class User < ActiveRecord::Base
278 |   # ...
279 | end
280 |
281 | # Create the MCP server
282 | mcp_server = FastMcp::Server.new(name: 'sinatra-mcp-server', version: '1.0.0')
283 |
284 | class Users < Mcp::Resource
285 |   uri "data/users"
286 |   resource_name "Users"
287 |   description "List of all users"
288 |   mime_type "application/json"
289 |
290 |
291 |   def content
292 |     JSON.generate(User.all.map { |user| { id: user.id, name: user.name } })
293 |   end
294 | end
295 |
296 | class CreateUserTool < Mcp::Tool
297 |   description "Create a User"
298 |   arguments do
299 |     required(:name).filled(:string).description("The user's name")
300 |   end
301 |
302 |   def call(name:)
303 |     User.create!(name:)
304 |   end
305 | end
306 |
307 | # Register resources
308 | mcp_server.register_resource(Users)
309 | mcp_server.register_tool(CreateUserTool)
310 |
311 | # Use the MCP middleware
312 | use FastMcp::Transports::RackTransport, mcp_server
313 |
314 |
315 | ## Deployment Considerations
316 |
317 | When deploying your Sinatra application with MCP integration, consider the following:
318 |
319 | 1. **Server Requirements**: Ensure your web server supports SSE for real-time communication.
320 | 2. **Load Balancing**: Configure load balancers to handle SSE connections properly.
321 | 3. **Timeouts**: Set appropriate timeouts for SSE connections.
322 | 4. **Resource Synchronization**: In multi-process environments, ensure resource updates are synchronized across processes.
323 |
324 | ## Next Steps
325 |
326 | - Check out the [examples directory](../examples) for more examples of using MCP.
327 | - Read the [Resources documentation](./resources.md) for more details on using MCP Resources.
328 |


--------------------------------------------------------------------------------
/docs/tools.md:
--------------------------------------------------------------------------------
  1 | # Working with MCP Tools
  2 |
  3 | Tools are a core concept in the Model Context Protocol (MCP). They allow you to define functions that can be called by clients, including AI models. This guide covers everything you need to know about defining, using, and extending tools in Fast MCP.
  4 |
  5 | ## Table of Contents
  6 |
  7 | - [What are MCP Tools?](#what-are-mcp-tools)
  8 | - [Defining Tools](#defining-tools)
  9 |   - [Basic Tool Definition](#basic-tool-definition)
 10 |   - [Tool Arguments](#tool-arguments)
 11 |   - [Argument Types](#argument-types)
 12 |   - [Argument Validation](#argument-validation)
 13 |   - [Default Values](#default-values)
 14 | - [Calling Tools From Another Tool](#calling-tools-from-another-tool)
 15 | - [Advanced Tool Features](#advanced-tool-features)
 16 |   - [Tool Hidden Arguments](#tool-hidden-arguments)
 17 |   - [Tool Categories](#tool-categories)
 18 |   - [Tool Metadata](#tool-metadata)
 19 |   - [Tool Permissions](#tool-permissions)
 20 |   - [Request Headers](#request-headers)
 21 |   - [Composing Tool Authentication](#composing-tool-authentication)
 22 | - [Best Practices](#best-practices)
 23 | - [Examples](#examples)
 24 |
 25 | ## What are MCP Tools?
 26 |
 27 | MCP Tools are functions that can be called by clients with arguments and return results. They are defined on the server side and can be discovered and called by clients. Tools can:
 28 |
 29 | - Perform calculations
 30 | - Access and modify resources
 31 | - Interact with external systems
 32 | - Call other tools
 33 | - Return structured data
 34 |
 35 | Tools are particularly useful for AI models, as they provide a way for models to perform actions in the real world.
 36 |
 37 | ## Defining Tools
 38 |
 39 | ### Basic Tool Definition
 40 |
 41 | To define a tool, create a class that inherits from `FastMcp::Tool`:
 42 |
 43 | ```ruby
 44 | class HelloTool < FastMcp::Tool
 45 |   description "Say hello to someone"
 46 |
 47 |   def call(**_args)
 48 |     "Hello, world!"
 49 |   end
 50 | end
 51 |
 52 | # Create a server
 53 | server = FastMcp::Server.new(name: 'example-server', version: '1.0.0')
 54 |
 55 | # Register the tool with the server
 56 | server.register_tool(HelloTool)
 57 | ```
 58 |
 59 | When defining a tool class, you can:
 60 |
 61 | - Set a description using the `description` class method
 62 | - Define arguments using the `arguments` class method with Dry::Schema
 63 | - Implement the functionality in the `call` instance method
 64 |
 65 | ### Tool Arguments
 66 |
 67 | To define arguments for a tool, use the `arguments` class method with a block using Dry::Schema syntax:
 68 |
 69 | ```ruby
 70 | class GreetTool < FastMcp::Tool
 71 |   description "Greet a person"
 72 |
 73 |   arguments do
 74 |     required(:name).filled(:string).description("Name of the person")
 75 |   end
 76 |
 77 |   def call(name:)
 78 |     "Hello, #{name}!"
 79 |   end
 80 | end
 81 |
 82 | # Register the tool
 83 | server.register_tool(GreetTool)
 84 | ```
 85 |
 86 | The `arguments` method takes a block where you can define:
 87 |
 88 | - Required arguments using the `required` method
 89 | - Optional arguments using the `optional` method
 90 | - Types and validations for each argument
 91 | - Descriptions for each argument
 92 |
 93 | ### Argument Types
 94 |
 95 | Fast MCP supports the following argument types using Dry::Schema predicates:
 96 |
 97 | - `:string`: A string value
 98 | - `:integer`: An integer value
 99 | - `:float`: A floating-point number
100 | - `:bool`: A boolean value (true/false)
101 | - `:array`: An array of values
102 | - `:hash`: A hash/object with key-value pairs
103 |
104 | Example with different types:
105 |
106 | ```ruby
107 | class ProcessDataTool < FastMcp::Tool
108 |   description "Process various types of data"
109 |
110 |   arguments do
111 |     required(:text).filled(:string).description("Text to process")
112 |     optional(:count).filled(:integer).description("Number of times to process")
113 |     optional(:factor).filled(:float).description("Multiplication factor")
114 |     optional(:verbose).filled(:bool).description("Whether to output verbose logs")
115 |     optional(:tags).array(:string).description("Tags to apply")
116 |     optional(:metadata).hash.description("Additional metadata")
117 |   end
118 |
119 |   def call(text:, count: 1, factor: 1.0, verbose: false, tags: [], metadata: {})
120 |     # Implementation
121 |     result = text * count
122 |     result = result * factor if factor != 1.0
123 |
124 |     if verbose
125 |       {
126 |         result: result,
127 |         tags: tags,
128 |         metadata: metadata
129 |       }
130 |     else
131 |       result
132 |     end
133 |   end
134 | end
135 | ```
136 |
137 | ### Argument Validation
138 |
139 | Fast MCP automatically validates arguments based on the Dry::Schema definition. If validation fails, an error is returned to the client.
140 |
141 | You can also add custom validation in the `call` method:
142 |
143 | ```ruby
144 | class DivideTool < FastMcp::Tool
145 |   description "Divide two numbers"
146 |
147 |   arguments do
148 |     required(:dividend).filled(:float).description("Number to be divided")
149 |     required(:divisor).filled(:float).description("Number to divide by")
150 |   end
151 |
152 |   def call(dividend:, divisor:)
153 |     # Custom validation
154 |     raise "Cannot divide by zero" if divisor == 0
155 |
156 |     dividend / divisor
157 |   end
158 | end
159 | ```
160 |
161 | ### Default Values
162 |
163 | You can specify default values in the method parameters of the `call` method:
164 |
165 | ```ruby
166 | class RepeatTool < FastMcp::Tool
167 |   description "Repeat a string multiple times"
168 |
169 |   arguments do
170 |     required(:text).filled(:string).description("Text to repeat")
171 |     optional(:count).filled(:integer).description("Number of times to repeat")
172 |   end
173 |
174 |   def call(text:, count: 3)
175 |     text * count
176 |   end
177 | end
178 | ```
179 |
180 | ### Authentication and Authorization
181 |
182 | Using [the `headers` method](#request-headers), you can access headers passed to the tool call. This can be used to identify a user by authentication details passed in headers:
183 | ```ruby
184 | class CurrentUserTool < FastMcp::Tool
185 |   description "Gets the current user details"
186 |
187 |   def call
188 |     JSON.generate current_user
189 |   end
190 |
191 |   private
192 |
193 |   def current_user
194 |     token = headers["AUTHORIZATION"]
195 |
196 |     # Validate token
197 |     # ...
198 |
199 |     user
200 |   end
201 | end
202 | ```
203 |
204 | This can be combined with the `authorize` method to ensure a user is authorized before allowing them to use the tool:
205 |
206 | ```ruby
207 | class PerformAuthenticatedActionTool < FastMcp::Tool
208 |   description "Perform an action which requires an authenticated user"
209 |
210 |   arguments do
211 |     required(:item_id).filled(:integer).description('ID of item to affect')
212 |   end
213 |
214 |   authorize do |item_id:|
215 |     current_user&.is_admin? &&
216 |       get_item(item_id).user_id == current_user.id
217 |   end
218 |
219 |   def call(item_id:)
220 |     # Perform action
221 |     # ...
222 |   end
223 |
224 |   private
225 |
226 |   def current_user
227 |     # Get current user
228 |     # ...
229 |   end
230 |
231 |   def get_item(id)
232 |     # Get item
233 |     # ...
234 |   end
235 | end
236 | ```
237 |
238 | You can also implement this in a parent class and the authorization will be inherited by all children. Children may also define their own authorization - in this case, _all_ authorization checks must pass for a caller to be allowed access to the tool.
239 |
240 | ## Calling Tools From Another Tool
241 | Tools can call other tools:
242 |
243 | ```ruby
244 |
245 | class GreetTool < FastMcp::Tool
246 |   description 'Greet one person'
247 |
248 |   arguments do
249 |     required(:names).array(:string).description("Name of person to greet")
250 |   end
251 |
252 |   def call(name:)
253 |     "Hey #{name}"
254 |   end
255 | end
256 |
257 | class GreetMultipleTool < FastMcp::Tool
258 |   description "Greet multiple people"
259 |
260 |   arguments do
261 |     required(:names).array(:string).description("Names of people to greet")
262 |   end
263 |
264 |   def call(names:)
265 |     raise "Server not set" unless self.class.server
266 |
267 |     greet_tool = GreetTool.new
268 |     results = names.map do |name|
269 |       # Call the tool
270 |       greet_tool.call(name: name)
271 |     end
272 |
273 |     results.join("\n")
274 |   end
275 | end
276 | ```
277 |
278 | ## Advanced Tool Features
279 |
280 | ### Tool hidden arguments
281 | If need be, we can register arguments that won't show up in the tools/list call but can still be used in the tool when provided.
282 | This might be useful when calling from another tool, or when the client is made aware of this argument from the context.
283 |
284 | ```ruby
285 | class AddUserTool < FastMcp::Tool
286 |   description 'Add a new user'
287 |   tool_name 'add_user'
288 |   arguments do
289 |     required(:name).filled(:string).description("User's name")
290 |     required(:email).filled(:string).description("User's email")
291 |     optional(:admin).maybe(:bool).hidden
292 |   end
293 |
294 |   def call(name:, email:, admin: nil)
295 |     # Create the new user
296 |     new_user = { name: name, email: email }
297 |
298 |     new_user[:admin] = admin if admin
299 |
300 |     new_user
301 |   end
302 | end
303 | ```
304 |
305 | The .hidden predicate takes a boolean value as argument, meaning that it can be variabilized depending on your custom logic. Useful for feature-flagging arguments.
306 |
307 | ```ruby
308 | class AddUserTool < FastMcp::Tool
309 |   description 'Add a new user'
310 |   tool_name 'add_user'
311 |   arguments do
312 |     required(:name).filled(:string).description("User's name")
313 |     required(:email).filled(:string).description("User's email")
314 |     optional(:admin).maybe(:bool).hidden(!ENV['FEATURE_FLAG'] == 'true')
315 |   end
316 |
317 |   def call(name:, email:, admin: nil)
318 |     # Create the new user
319 |     new_user = { name: name, email: email }
320 |
321 |     new_user[:admin] = admin if admin
322 |
323 |     new_user
324 |   end
325 | end
326 | ```
327 |
328 | ### Tool Categories
329 |
330 | You can organize tools into categories using instance variables or metadata:
331 |
332 | ```ruby
333 | class AddTool < FastMcp::Tool
334 |   description "Add two numbers"
335 |
336 |   class << self
337 |     attr_accessor :category
338 |   end
339 |
340 |   self.category = "Math"
341 |
342 |   arguments do
343 |     required(:a).filled(:float).description("First number")
344 |     required(:b).filled(:float).description("Second number")
345 |   end
346 |
347 |   def call(a:, b:)
348 |     a + b
349 |   end
350 | end
351 |
352 | class SubtractTool < FastMcp::Tool
353 |   description "Subtract two numbers"
354 |
355 |   class << self
356 |     attr_accessor :category
357 |   end
358 |
359 |   self.category = "Math"
360 |
361 |   arguments do
362 |     required(:a).filled(:float).description("First number")
363 |     required(:b).filled(:float).description("Second number")
364 |   end
365 |
366 |   def call(a:, b:)
367 |     a - b
368 |   end
369 | end
370 | ```
371 |
372 | ### Tool Metadata
373 |
374 | You can add metadata to tools using class methods:
375 |
376 | ### Metadata
377 | MCP specifies that we can declare metadata in the tool call result. For this, we have a _meta attr_accessor in all tools. We kept the _meta original naming to avoid collisions with arguments that could be named "metadata". It is a hash that accepts modifications and will be returned to the tool call response whenever it has been modified.
378 |
379 | ```ruby
380 | class RepeatTool < FastMcp::Tool
381 |   description "Repeat a string multiple times"
382 |
383 |   arguments do
384 |     required(:text).filled(:string).description("Text to repeat")
385 |     optional(:count).filled(:integer).description("Number of times to repeat")
386 |   end
387 |
388 |   def call(text:, count: 3)
389 |     _meta[:foo] = 'bar'
390 |     _meta[:some_key] = 'some value'
391 |
392 |     text * count
393 |   end
394 | end
395 | ```
396 |
397 | ### Tool Permissions
398 |
399 | You can implement permission checks:
400 |
401 | ```ruby
402 | class AdminActionTool < FastMcp::Tool
403 |   description "Perform an admin action"
404 |
405 |   class << self
406 |     attr_accessor :required_permission
407 |   end
408 |
409 |   self.required_permission = :admin
410 |
411 |   arguments do
412 |     required(:action).filled(:string).description("Action to perform")
413 |     required(:user_role).filled(:string).description("Role of the user making the request")
414 |   end
415 |
416 |   def call(action:, user_role:)
417 |     # Check permissions
418 |     raise "Permission denied: admin role required" unless user_role == "admin"
419 |
420 |     # Perform the action
421 |     "Admin action '#{action}' performed successfully"
422 |   end
423 | end
424 | ```
425 |
426 | ### Request Headers
427 |
428 | When using the Rack transport, HTTP headers from tool call requests are exposed to tools via the `headers` method:
429 |
430 | ```ruby
431 | class MyTool < FastMcp::Tool
432 |   def call
433 |     "Host header is #{headers["HOST"]}"
434 |   end
435 | end
436 | ```
437 |
438 | ### Composing Tool Authentication
439 |
440 | It can be useful to extract authentication into modules to share functionality without having to bake logic into your tool's ancestor chain.
441 |
442 | ```ruby
443 | # This module adds a current_user method to tools which include it, and requires that the user is present
444 | module UserAuthenticator
445 |   def self.included(tool)
446 |     tool.authorize do
447 |       not current_user.nil?
448 |     end
449 |   end
450 |
451 |   def current_user
452 |     # Get current user
453 |     # ...
454 |   end
455 | end
456 |
457 | # This module ensures that the THIRD_PARTY_API_KEY header is set
458 | module ThirdPartyApiKeyRequired
459 |   def self.included(tool)
460 |     tool.authorize do
461 |       not headers['THIRD_PARTY_API_KEY'].nil?
462 |     end
463 |   end
464 | end
465 |
466 | class MyTool < FastMcp::Tool
467 |   # Extra authentications are executed in the order they appear in the tool.
468 |   # In this case:
469 |   # - Any authorizations from ancestor classes
470 |   # - UserAuthenticator
471 |   # - This tool's authorize call
472 |   # - ThirdParyApiKeyRequired
473 |   include UserAuthenticator
474 |
475 |   authorize do
476 |     # My custom auth for this tool
477 |     # ...
478 |   end
479 |
480 |   include ThirdPartyApiKeyRequired
481 | end
482 | ```
483 |
484 | ## Best Practices
485 |
486 | Here are some best practices for working with MCP tools:
487 |
488 | 1. **Use Clear Names**: Give your tools clear, descriptive names that indicate their purpose.
489 | 2. **Provide Good Descriptions**: Write detailed descriptions for tools and their arguments.
490 | 3. **Validate Inputs**: Use the schema validation to ensure inputs are correct before processing.
491 | 4. **Handle Errors Gracefully**: Catch and handle errors properly, providing clear error messages.
492 | 5. **Return Structured Data**: Return structured data when appropriate, especially for complex results.
493 | 6. **Test Your Tools**: Write tests for your tools to ensure they work correctly.
494 | 7. **Document Usage**: Document how to use your tools, including examples.
495 | 8. **Keep Tools Focused**: Each tool should do one thing well, rather than trying to do too much.
496 |
497 | ## Examples
498 |
499 | Here's a more complex example of a tool that interacts with resources:
500 |
501 | ```ruby
502 | class IncrementCounterTool < FastMcp::Tool
503 |   description "Increment a counter resource"
504 |
505 |   # Class variable to hold server instance
506 |   @server = nil
507 |
508 |   # Class methods to get and set server instance
509 |   class << self
510 |     attr_accessor :server
511 |   end
512 |
513 |   arguments do
514 |     optional(:amount).filled(:integer).description("Amount to increment by")
515 |   end
516 |
517 |   def call(amount: 1)
518 |     raise "Server not set" unless self.class.server
519 |
520 |     # Get the counter resource
521 |     counter_resource = self.class.server.resources["counter"]
522 |     raise "Counter resource not found" unless counter_resource
523 |
524 |     # Parse the current value
525 |     current_value = counter_resource.content.to_i
526 |
527 |     # Increment the counter
528 |     new_value = current_value + amount
529 |
530 |     # Update the resource
531 |     counter_resource.update_content(new_value.to_s)
532 |
533 |     # Return the new value
534 |     { previous_value: current_value, new_value: new_value, amount: amount }
535 |   end
536 | end
537 |
538 | # Set the server reference
539 | IncrementCounterTool.server = server
540 |
541 | # Register the tool
542 | server.register_tool(IncrementCounterTool)
543 | ```
544 |
545 | This tool increments a counter resource by a specified amount (or by 1 by default) and returns the previous and new values.
546 |


--------------------------------------------------------------------------------
