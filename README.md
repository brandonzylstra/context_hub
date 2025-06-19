# Context Hub ##

**Context Hub** is a personal MCP (Model Context Protocol) server that provides a central location for user preferences, coding rules, development environment details, and instructions, all accessible by LLM-powered developer tools through the MCP protocol. It also acts as a proxy to route, manage, and cache requests to additional MCP servers, greatly simplifying configuration across tools.

## 🧪 Status:  Highly Experimental & Under Construction 🏗 ##

This repo might swallow all your laundry, neuter your cat, and make you cough up furballs. Use at your own risk.

---

## ⚡ Project Goals ##

- **Centralize LLM/Tool Context:** Offer one API endpoint that contains all of your coding preferences, instructions for LLMs (e.g., Claude, Cursor, BoltAI, Windsurf, Zed), and rules you want followed across all your tools.
- **Proxy Other MCP Servers:** Act as a local hub that can route and aggregate requests to any configured MCP server (e.g., services like context7, GitHub, PostgreSQL, Obsidian, etc.).
- **Easy Expansion:** Make it simple to connect new MCP servers once and have every MCP-compatible tool use them instantly.
- **Question-Based Rule Generation:** Simply answer a series of simple questions to define the desired behavior for your LLMs.
- **User-Defined Questions and Data:** Add your own questions/preferences, and share them in various formats (JSONC, TOML, YAML, etc.).
- **Rule File Import & Export:** Pull in preferences from your existing rule files, or export your preferences to the rule files used by your favorite tool.
- **Customized Tool- or Project-Specific Rules:** Make it easy to expose project-specific or tool-specific instructions/rules (like CoPilot instructions or Windsurf rules) to the MCP API, so you're never forced to make everything homogeneous.

---

## ✨ Key Features

- **Unified User Preferences:** Collect and serve answers to questions about your coding style, environment, and custom preferences—the kind of information LLM dev tools crave.
- **MCP Proxy and Aggregation:** Configurable backend connections to other MCP servers with automatic request routing and optional caching.
- **One-Stop Setup:** Simply configure your favorite dev tools to use your local Context Hub MCP server as their context source. Context Hub acts as a proxy to any other MCP/MCP-compatible server you connect, so you never need to repeat server setup in every tool.
- **Server Onboarding Requests:** Other MCP servers can request to be proxied (for example, a gem in each Rails project announcing its MCP endpoint, feeding live project context to your dev tools).
- **Custom & Shareable Questions:** Create, import, and export personal or shareable "questions" which can be used to enrich your context API.

---

## 🏗️ Current Status: Nearing End of Phase 1

This project is under active development and **Phase 1** is almost complete.

### Phase 1: Foundation & Preferences (in progress)
- Rails 8 + [Fast MCP](https://github.com/yjacquin/fast-mcp) backend foundation
- Collect answers to basic preference/environment questions useful for LLMs/dev tools
- Enable user-defined, extensible questions
- Support for pointing to files with instructions or project/tool-specific rules
- Prepare groundwork for serving as a Model Context Protocol server

### Planned Phases

- **Phase 2:** Configurable shell tool integration
- **Phase 3:** Ruby-based tool support
- **Phase 4:** JavaScript/TypeScript tool integration (Node.js/Nodo)
- **Phase 5:** AI-generated tool creation UI
- **Phase 6 and Beyond:** Workflow, credential, and sharing enhancements

---

## 🔥 Why Use Context Hub?

- **Stop Tool Setup Fatigue:** Set up your servers once per machine, not per tool.
- **Smarter LLMs:** Feed your coding and environment preferences directly to the tools that need them.
- **Extensible:** Add your own custom questions/preferences easily.
- **Standardized Sharing:** Share/export/import questions and rules for rapid onboarding across environments or teams.

---

## Usage & Getting Started

_Context Hub is not production-ready yet, but you can follow development and try out early versions as Phase 1 wraps up._

For development, you’ll need:
- Ruby (Rails 8+)
- SQLite3
- Yarn (for JS/CSS toolchains)
- [Fast MCP gem](https://github.com/yjacquin/fast-mcp)
- TailwindCSS (via Rails/Tailwind integration)

**More detailed setup, deployment, and configuration instructions are coming as the code and features solidify in Phase 1.**

---

## License

MIT
