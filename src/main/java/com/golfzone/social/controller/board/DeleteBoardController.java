package com.golfzone.social.controller.board;

import com.golfzone.social.board.BoardDAO;
import com.golfzone.social.board.BoardDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteBoardController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String boardResultMsg = "게시글 삭제 실패";
        // init get parameter
        String boardNum = req.getParameter("boardNum");

        BoardDAO boardDAO = new BoardDAOImpl();

        int flag = boardDAO.deleteBoard(Integer.parseInt(boardNum));
        if (flag == 1) {
            boardResultMsg = "게시글 삭제 완료..";
        }
        System.out.println(boardResultMsg);
        req.setAttribute("boardResultMsg: ", boardResultMsg);
        req.getRequestDispatcher("/").forward(req, resp);

    }
}