package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReactionPointRepository {

	int getSumlikeReactionPoint(int loginedMemberId, String relTypeCode, int relId);
	
	int getSumDislikeReactionPoint(int loginedMemberId, String relTypeCode, int relId);

	int increaseReactionPoint(int loginedMemberId, String relTypeCode, int relId);

	int decreaseReactionPoint(int loginedMemberId, String relTypeCode, int relId);

	int deleteLikeReactionPoint(int loginedMemberId, String relTypeCode, int relId);

	int deleteDislikeReactionPoint(int loginedMemberId, String relTypeCode, int relId);

	int getSumReactionPoint(int loginedMemberId, String relTypeCode, int relId);

}