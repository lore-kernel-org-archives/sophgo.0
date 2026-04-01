Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E451E0B9C
	for <sophgo@lists.linux.dev>; Wed,  1 Apr 2026 00:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003787; cv=none; b=NB5uXtC71odUbmAiR9QnNfpOEG+Eb3ZJk55ZhuyB2X/4O0ceVrKy7jZmHNIA7IckoTQSwmkvGLcrIvIP/rG7vgY7jbREL4VqxYy0NouGo3a2LuapRvHDIS/0X/RdtfY3VOlnhM7aPPBXzkksiCloyk8teFcjJJDPxU9eQBiae7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003787; c=relaxed/simple;
	bh=9+803OXsW4RpYm11ZzkRV2bmZBdLytudY3nvjZ2Dlo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTo4S3t81gxq/IP+mZRdcstBQ49GMiW6MsCFSYN36KrSmx2ecCMF+QK5pP8jrM1ixYcvDSIFe+yqahbFAeVQ1+H1vavIJPA2qRndvgdQrcLV5WD0pDos6bnPNH7kxzpBGSfKlWH9GclG/WD+khIEraO3j16NW6BWIt63zL7molA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1utyX8t; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1utyX8t"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cd6614a90so774730b3a.3
        for <sophgo@lists.linux.dev>; Tue, 31 Mar 2026 17:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775003786; x=1775608586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EwQDh831V9DcLgoz9eTKc5QM2T8aLiYTdwb2OH1M5U=;
        b=F1utyX8tkXDkPK07w1Y+HMp8xzq816G5E82Mt73PhftH6J4m191mCFtkZVwY1wwkw2
         7hYeQ95oTfVf2tB1WT0a4zMhkTMAL3S4piz0se9XgRJBTKVbftTZBs7jOoLScVg06BZP
         aKpajrLo7KFbz+Yi6QGTDL5quM5oDTElcf/PnAl6i2Jgw7pAdSeEzGvJKTMrr+uZ/uCL
         nPdjSBSjr6B3ZhLHcCQchV8yY56Z7EnVgojyVjBc07HSlbS1J/9J/quHSPtzVBhwYy9+
         6LE+RPW6R/6F3JZJLRYaljFgGuAVhx7BIISyFyh1M+S7pM5liwl9sj+l1LPsgxiuN4y7
         Kqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003786; x=1775608586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1EwQDh831V9DcLgoz9eTKc5QM2T8aLiYTdwb2OH1M5U=;
        b=tF10GotSveY4ZHgY4X+OTkDFJkLxhzbu97AHoY9ccEDndvjd3F1etCmU6HBrM6c4Lz
         kRfCKkorkQXysPmxR8oHoKdoPrEPhmg8luubqekOLV/JfLcLHUE0CNmLjgwzUYDw1Ojf
         9MnylZJsgUB+vncEgAu1C7Ojf1RBillY2vANo1lgEK8sjRNGMCjujclvaVppi+sAhIbA
         OsPyi2QGDZFtNvDbOdL19OAcO3oFyQAck2JinzVbTLdkii26wks27EdfMZqR3drSVl0+
         9cfZQwdfgynMNNxd9M8HvkHkMUanpCgHG3uSOLZ0ydizamXQZ4r+gnyRyJSP2LygDTgw
         7Gxg==
X-Forwarded-Encrypted: i=1; AJvYcCVm5Tye8eC5LFMsS865EGHG//Tf/uXb0JyUtx6axCoczgx6pXIp9wLCg2fje7SjJySH3NHfbMs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy73B2bbTo32MHrJR9IUki1nGY7YZ3kRnOiXWTToDJz5c8hF9E9
	sJuvzhgFjZxj3K9GDeeEarLRhNp/rkNumVM5hdRS79jTABFWCtL1ar/q
X-Gm-Gg: ATEYQzzWm/Tc86MeUI1Y4R9NvlZjN9a6vogpXLStsD9HL3yxt18ZVtFf5aI9HxeeqmI
	M5Xx1GuxiQgHlZgAitq+lKxESfWtsdQhqKO1JUYMAI/7rK/TuHLXd91bDrelG0gGi5Zi9OE6YJd
	cdNbfYvyqO+3is8wwbCetsNk8zwh+eHl2QOyjp3gBmwnPcW0bPICDgIe3MJEqBGR9RrXxcKMTZm
	lVEmNGtZX+IkdYcaVHLzH85rMbFGTnBJaYcxjOwgKl6z6MZdyOqrz6G9PBxYkg36HLoJAm4hpxj
	n0ZllGlsmNiU86iTvEb2DCcW1pU1AS0wg0201ffOQtpUy3WlnNReFhurr0kRc9uT2K13/mAEdts
	n7Uq6OY6/8WYmF18T0Qew2KYdjHzpcvzjxoIHxfTdOe1gz07h0VBY+S2SLE1KSMVqMFqRo301eA
	8kYAZO0usBzmxcOlLGSqxQyhDyS3fBryQcFA==
X-Received: by 2002:a05:6a00:a21d:b0:82c:e0d7:2681 with SMTP id d2e1a72fcca58-82ce8982762mr1602910b3a.16.1775003785933;
        Tue, 31 Mar 2026 17:36:25 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm11554549b3a.50.2026.03.31.17.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:36:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] pinctrl: sophgo: pinctrl-sg2044: Fix wrong module description
Date: Wed,  1 Apr 2026 08:35:50 +0800
Message-ID: <20260401003552.363205-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401003552.363205-1-inochiama@gmail.com>
References: <20260401003552.363205-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the SoC model in module description string, it should be
sg2044 instead of sg2002.

Fixes: 614a54cb5ac3 ("pinctrl: sophgo: add support for SG2044 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-sg2044.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2044.c b/drivers/pinctrl/sophgo/pinctrl-sg2044.c
index b0c46d8954ca..cf0b674c038f 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2044.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2044.c
@@ -714,5 +714,5 @@ static struct platform_driver sg2044_pinctrl_driver = {
 };
 module_platform_driver(sg2044_pinctrl_driver);
 
-MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
+MODULE_DESCRIPTION("Pinctrl driver for the SG2044 series SoC");
 MODULE_LICENSE("GPL");
-- 
2.53.0

