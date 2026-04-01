Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D643B1A680C
	for <sophgo@lists.linux.dev>; Wed,  1 Apr 2026 00:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003782; cv=none; b=UfCbqrl6JPW+NbgVB9ORlkALDF0LfJST78SXL74Ih0nw0Mc1mp6LCG+y23JQoehYmtsMVlqAsYSSOCQozrFxN47AITiaZ83zB98gdFwBGJ01O9wpQl3PfpNQk2LI8G+kmMymSBJBdKf/n3/KckcKV12tZW5RgYz1Jv7jMYTC1tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003782; c=relaxed/simple;
	bh=osTPLN0RQ/XeSuhMQ/GV3cT03A6c3tExd2Q/kFEHnOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4oKVO6H7GQpfUOM4E6izJkBLiJcAfSwGOsdEql3deMYCpxsTCPkVd9EIXRXp82wjSqYWKdrgGthLmfKB1WaouYMM9zFbdj6ibTDeAWs4qEVHvEoJwgdnIr8q6O4kTVN5k+JbmXbc2V4TyqX4G6V0E0SqxrntlpXZtw1Bfh8N3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGuP3hrt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGuP3hrt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824c9da9928so4018986b3a.3
        for <sophgo@lists.linux.dev>; Tue, 31 Mar 2026 17:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775003781; x=1775608581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvbcL88GKEUluNY9FycTq/fLFvScGGI8LWzK2NuHQOM=;
        b=WGuP3hrtAae/bDrA1QUZl8UM811vSegkiIWtPeJdRHUBH2mu3xOBzPfGe4Zk7sdJQL
         EniukFGtVLaZb5Qe3C/sTNYpm99iZGA6HA+1dIstFf6uDfki/QBYF18++mDU/+CZ0nbz
         NZ4kYvUk1QEjINCU306QDZvNQIvCyQtnGrul5xlEgCCHo5hSGobr1lpAFzvZrOpx2UyV
         RXS0nP3OQHh53AmGjkXGJhhTNqjIR043FA6eT+kgwtmliVoujZgCqSKhHdfgfjM13oTM
         peH1ppOsCLDzVhEkR4EPjCxpaPDsqibCFMzSK9RA90HP9mJ3AZ4AuRl4tqDM0kiw2Cux
         Fpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003781; x=1775608581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvbcL88GKEUluNY9FycTq/fLFvScGGI8LWzK2NuHQOM=;
        b=butiaaOeDcLyhZqs4pWhXPVSox94NlWHlaTEUEOvbwWMZXKfMIWYKM/Jj92w/6EOQh
         s57MIbWCqt7tjrtsaBoxIhZRTSQtoFawOYHembmdFWVD+J8CGCvqTKY0LwFG4zKbCHs3
         PpSXmSs1Vv5UcvfbJrou9m9CHk/KQay7ydpwMB4CE/LJX/eX/DsS8Bk/sJHD9FJdXNm/
         kSZRCjYSB+JDYLhCsY9UUEUBHIkFtmtyf48sXIygyd9cs93aiAUxIHJaEg2H5uQRrOPE
         CXtmL4MdD05T01fuX+u+mexCXmXxG14/e4f4/7Z4yZ6QMFiJORNkVqn4SbStyupcvgmq
         W2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzlvqHk9mVKhzMB6QMsMLS/85g3ByjVg3dRiBDiVyutxPzF73LZ3i63eNMr2tTTAUtnCPZ9yU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/OH8cA13qPB4bojoHfOWfLvDYiIE1AhWOjTjedJb7tUcStwlk
	MvUgRihKDUKZLDVNKhC8aJNcCvOgfchPllroraM60pn6fIu+GGXf9pKs
X-Gm-Gg: ATEYQzw7kSJSh4z17sq8dWfzHjDc96mmhHnrXiG8ez6U0r2t0c6mnstOMjBbyrQsiaZ
	SNWCnD2YOKsU2U1Tc0UVPytjonkdCZOqdGz95CPQKwm5RdXKk6M+IeMYzGReNPk11qCVrAldBpJ
	aYdVfsiN6TGIXSXzHMjv2Qghj2E08/6p0WkxE8Z9wtqcxSLytD9GpZ8QoTiL/d9j0DH0qAS8DuA
	JmIrjLQ9hJd6nHnWSu7Q99HcFx6lse1QtefD2qajwj8xNUdD0fWoQTp1xHtlEnJnzy4WvzHR/Br
	wwS0z/Guc/052J5ovL/4X0BvK7VwPFtm+mUO47pu4kAvjTcFZccTXmHimjU3NZvIItz3hNHNAcM
	JlniQ6gTXyYAaT3wG4Db+AFKP0o27w/tMS0gV4q9WmKjAiLRaEVPoVEXKTDLBpnDFv8tWvnnfM5
	1EP7IYyjHXSI0/XRPPE06p1yM=
X-Received: by 2002:a05:6a00:3316:b0:823:f74:662f with SMTP id d2e1a72fcca58-82ce8b46477mr1652495b3a.51.1775003781167;
        Tue, 31 Mar 2026 17:36:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ce713cf2fsm1235599b3a.60.2026.03.31.17.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:36:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] pinctrl: sophgo: Fix SoC module in the module description string
Date: Wed,  1 Apr 2026 08:35:48 +0800
Message-ID: <20260401003552.363205-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC module in module description string is not correct in
pinctrl-sg2042.c and pinctrl-sg2044.c. Fix them

Inochi Amaoto (2):
  pinctrl: sophgo: pinctrl-sg2042: Fix wrong module description
  pinctrl: sophgo: pinctrl-sg2044: Fix wrong module description

 drivers/pinctrl/sophgo/pinctrl-sg2042.c | 2 +-
 drivers/pinctrl/sophgo/pinctrl-sg2044.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.53.0

