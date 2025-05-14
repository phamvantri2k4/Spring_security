<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hungdev.entities.Post" %>

<html>
<head>
    <title>Quản trị Bài viết</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: #f0f2f5;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }

        h2 a {
            text-decoration: none;
            color: #007bff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eef4ff;
        }

        td {
            vertical-align: top;
            color: #333;
        }

        .status {
            font-weight: bold;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        .status.PUBLISHED {
            background-color: #d4edda;
            color: #155724;
        }

        .status.DRAFT {
            background-color: #fff3cd;
            color: #856404;
        }

        .status.DELETED {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><a href="${pageContext.request.contextPath}/home">← Quay lại Trang chủ</a></h2>

        <%
            List<Post> posts = (List<Post>) request.getAttribute("posts");
            if (posts != null && !posts.isEmpty()) {
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Nội dung</th>
                <th>Người đăng (ID)</th>
                <th>Trạng thái</th>
                <th>Ngày tạo</th>
            </tr>
            <%
                for (Post post : posts) {
            %>
            <tr>
                <td><%= post.getId() %></td>
                <td><%= post.getTitle() %></td>
                <td><%= post.getBody() %></td>
                <td><%= post.getUserId() %></td>
                <td>
                    <span class="status <%= post.getStatus().name() %>">

                        <%= post.getStatus() %>
                    </span>
                </td>
                <td><%= post.getCreatedAt() %></td>
            </tr>
            <%
                }
            %>
        </table>
        <% } else { %>
            <p>Không có bài viết nào được tìm thấy.</p>
        <% } %>
    </div>
</body>
</html>
