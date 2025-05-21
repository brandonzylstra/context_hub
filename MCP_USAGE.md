# MCP Usage Instructions

This guide explains how to access and test the Model Context Protocol (MCP) endpoints provided by Context Hub, and how to troubleshoot common issues.

---

## Accessing MCP Endpoints

Context Hub exposes MCP-compatible endpoints at `/mcp`. These endpoints allow MCP clients and tools to access your preferences and other resources.

### Example Endpoints

- **User Preferences:**  
  `GET http://localhost:3000/mcp/user_preferences`  
  Returns a JSON object with all your preference categories and their values.

- **Sample Users Resource:**  
  `GET http://localhost:3000/mcp/examples/users`  
  Returns a JSON array of users (for demonstration).

### How to Test

You can test these endpoints using your browser, `curl`, or any HTTP client:

```sh
curl http://localhost:3000/mcp/user_preferences
curl http://localhost:3000/mcp/examples/users
```

You should receive a JSON response. If you see an error or blank page, see troubleshooting below.

---

## Available MCP Tools

Context Hub also exposes several tools via MCP, such as:

- `GetUserPreferencesTool`
- `SetUserPreferenceTool`
- `AddCustomPreferenceTool`
- `ListPreferenceCategoriesAndQuestionsTool`
- `SystemInformationTool`
- `ConfigurationFilesTool`

These tools are accessible to MCP clients that support tool invocation.

---

## Troubleshooting

### 1. Endpoint Not Found (404)

- **Symptom:** Visiting `/mcp/user_preferences` or `/mcp/examples/users` returns a 404 error.
- **Solution:**  
  - Ensure the Rails server is running.
  - Check that Fast MCP is properly mounted in `config/initializers/fast_mcp.rb`.
  - Make sure you have not changed the `path_prefix` from `/mcp`.

### 2. Blank or Error Response

- **Symptom:** The endpoint returns an error or empty response.
- **Solution:**  
  - Check the Rails server logs for errors.
  - Ensure your database is migrated and seeded with data.
  - Confirm that the resource classes (e.g., `UserPreferencesResource`) are present and correctly implemented.

### 3. Tools/Resources Not Available

- **Symptom:** MCP clients do not see expected tools/resources.
- **Solution:**  
  - Ensure your tool/resource classes inherit from `ApplicationTool` or `ApplicationResource`.
  - Check that registration is happening in the Fast MCP initializer (this is automatic if you use the provided base classes).

---

## Additional Notes

- MCP endpoints are read-only unless you invoke tools that modify data.
- You can extend MCP by adding new resources or tools in `app/resources` and `app/tools`.
- For more information on MCP, see [modelcontextprotocol.io](https://modelcontextprotocol.io/).

---

If you encounter issues not covered here, check your Rails logs and configuration, or consult the Fast MCP documentation.