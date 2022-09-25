package com.golfzone.social.board;

import com.golfzone.social.db.MariaDB;

import java.sql.*;
import java.util.List;

public class BoardDAOImpl implements BoardDAO{
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public BoardDAOImpl() {
        try {
            Class.forName(MariaDB.DRIVER_NAME);
//			jdbcConnectionTest();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void jdbcConnectionTest() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(MariaDB.URL, MariaDB.USER, MariaDB.PASSWORD);
            System.out.println("conn successed...");

            String sql = "select version() as version";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println(rs.getString("version"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } // end finally
    }

    @Override
    public List<BoardVO> selectAll() {
        return null;
    }

    @Override
    public int insertBoard(BoardVO boardVO) {
        int flag = 0;
        try {
            conn = DriverManager.getConnection(MariaDB.URL, MariaDB.USER, MariaDB.PASSWORD);
            System.out.println("conn success");
            String sql = MariaDB.INSERT_BOARD;
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardVO.getBoardTitle());
            pstmt.setString(2, boardVO.getBoardContent());
            pstmt.setString(3, boardVO.getBoardWriter());
            flag = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } // end finally
        return flag;
    }
}
