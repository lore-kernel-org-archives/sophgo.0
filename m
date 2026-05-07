Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23CD221DB3
	for <sophgo@lists.linux.dev>; Thu,  7 May 2026 02:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120476; cv=none; b=ZK1DG2qTFqyUm5aVWdA9LsXbN7MAfimyHg8FskCUcMHOPfPB+vI4IhI44IwxBtNChKzCzqUHcnqOEGJzQLPXYsb40rA+qF1KGHCcLCdbZG+Psa5NlycCPQYaaSqHdTSnBQ0MbkFwfDfpcOPsn/KgAI11scS6Vg6a8wubXyTVa5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120476; c=relaxed/simple;
	bh=j4/UvI9qZTcXngFzaeXmkSq3+ttKof0/O9p/KrcSJ6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jp6BENDKWtDLf7EmpcSHb1DSEPi08fTL02HqEr1rj7Y2i8h6RyPj3LFhGFVBdA+9ccUbhW6kvHZgWQbTfubsk4SmHBAjoZozmgWaAimki2vVSFd+Pe8va4BhhEAXmVVraSpqHZIE6+aDu/J2HP78cSwTnUQJp71zUCjskC9+mps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pEFbxCKy; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pEFbxCKy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778120473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dzVPzgzA4ra7vreCThYD/sn11wwurMjNfg4HXpJ/9UM=;
	b=pEFbxCKyrFICapRkwtKeKoKom6skQzx33uErQZe9FffDvAdqDBCkQNhgv6QrdSsJHXKQYD
	1P1nour0iti1qtq8TDAtE6amnfOPRq9uSE6xm6O4GBF7X4Mgk+gVwfOHOR1M584JKEBWMO
	x9ANErlGztUBf5UEgbbcinPiHiBSH1U=
From: Chen Wang <chen.wang@linux.dev>
To: linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	inochiama@gmail.com
Cc: Chen Wang <chen.wang@linux.dev>
Subject: [PATCH] MAINTAINERS: update Chen Wang's email address
Date: Thu,  7 May 2026 10:20:58 +0800
Message-ID: <20260507022058.3913-1-chen.wang@linux.dev>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Update my email address as my original email provider may
block emails in kernel development.

Signed-off-by: Chen Wang <chen.wang@linux.dev>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..e02030d212d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24966,7 +24966,7 @@ F:	drivers/char/sonypi.c
 F:	drivers/platform/x86/sony-laptop.c
 
 SOPHGO DEVICETREES and DRIVERS
-M:	Chen Wang <unicorn_wang@outlook.com>
+M:	Chen Wang <chen.wang@linux.dev>
 M:	Inochi Amaoto <inochiama@gmail.com>
 L:	sophgo@lists.linux.dev
 W:	https://github.com/sophgo/linux/wiki

base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
2.43.0

