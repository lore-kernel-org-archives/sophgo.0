Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5DB158DD8
	for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327324; cv=none; b=HmGZE8u8lqrtzuxyEjqRDky6bxRCrWGGPrJC/Ot668Tug7dj8CA1iL5A2oDmgg7p9behDD/w356zkuNfnKJloQlS3/7cNoojGRG1XXOEgZbma3ALb3MWS7rk2vdCADHqJv2wj1ox7ww4NfwVQAxaCbdi3ttI0W4tvgqpSSaA5nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327324; c=relaxed/simple;
	bh=r8et8ge8AdEx0Y13ADPu19VRp6CNcG889or64+bSVlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4LcyhEp62oNiZe3Ykh2XVSS1iWaANNEtmT636un38L4zP0GhkyDzkLJamMejzF/Ckr5OJEJ+yojs/QVGbWmo4FKoYAC4aaqd0iNUxCnQuqd2vmy1NdyJ/0xGsGXUSpO5AImN3IP+J5Jd26jkC1C7NSmaMTmGrRTvi28I8abPQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKBpY70t; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKBpY70t"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c0590fdae5so472086685a.0
        for <sophgo@lists.linux.dev>; Tue, 11 Feb 2025 18:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739327321; x=1739932121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hK3qko9u55P2rWVGBnX77n7mkbH2Dx7i84rsPS5o7p4=;
        b=IKBpY70tM7G8JLtMUC4SJZYWfVe8QlPKKLMw4iD/Gpo23dV3+Li4V3z6vA+d1h4o/S
         +IGMtYP4umkU1qWJEUxNuhnELDQ1LzTcubhnqcmLFSpH7rmgjXE1QQWJvm5OYhNZxmOj
         CCfv/tc4CFm/UVM7qXYb6VhQfY6zs4PsDU4SLbHtlz+7kLzqbbK+NVO+R6BSB+E5AAMB
         MxFkfez3+yshIOsGJkdfWQpU6Y00i3AXtI0rY7YPv78P4cKKq3O2kzOupIaLBntg+MDM
         z1VTm4NfcuZKto8K29agNY3WZKfWYBg1oq6nTIzdq9+rINPJ6TmCJqFyRqNMzcyzblsW
         QGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739327321; x=1739932121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hK3qko9u55P2rWVGBnX77n7mkbH2Dx7i84rsPS5o7p4=;
        b=OoUr7+88+B7SIAtv2XPLGM5KOSsuwUFTMkTWoKIOFtd7GWg7dZrVSx5SiV1QFz4gwG
         dXyFzc/mIM9lYOGELEhfkpPhEa8COIyohBZ3AD1ssqjPxBZgNyC1mDR57A11oM4pPsx8
         1PPbjIJ/Djvchfp6O97WVqSV8lzknrADkfTKtqi5am9keZZknY32zFGZZvCNONT+uVrR
         +8ogm6cQyLjK9mATKHoAFhJQW+ETZtzHZ6T2DWdtZuVimWkqyg1CE1VoEK/5NKhlsOpp
         21XyYHbiMdjyqLN1i3hmJe9ZCuNyvsOivBEknoJZ+pjP2smcBUjZjNhzcSgtTEC1jikg
         AoBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEG8S7mzBYKcejWTn7O4UPgT4ZZczov3SD/kYq54j9eTP2e/YtTfe7uC1KgkHd3d0t7numT1I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkibhCniaXis8W2pcXolR6V12gG60A45CcxooQbBic/VeHCznx
	XTPfRR8XgfUXRciTQRnfXLqPwjE8fv6Q3fL22G8TvV5T8H2z8Xfa
X-Gm-Gg: ASbGncv/rWdJ7EHif/sETmEeNkvyiXTb/T+bH9LJoADP0YYHo+BKh6FzCRTsgrYzycj
	A9ZapeK+h05mzrWYg6qbuMigtQBv5Q/fMHlUHIx03bJgtT18495vClBQdysmTdYCQNj5/XYCtRs
	bahzeZ7IOTn6RSS3ZOLoFDlxHzJDezkQnVVYeqf1MJOPCdqvAaI7Rez18aOIf7oTQEe/3RBcJOt
	2Q/ko4YMAISvqSgn0BBfU8m91ycy/snVtZRWzCeC8EioN/lUy1Ew/ZkXbW2+/sAErM=
X-Google-Smtp-Source: AGHT+IGpNcZTCyXp/wwIN2rLy73VjHg6eU+7hL0k3ixDwpCD9L4DzbFxt8rfD8lBDMSngkcnnyeSyQ==
X-Received: by 2002:a05:620a:1990:b0:7a9:b914:279c with SMTP id af79cd13be357-7c06fb95ea1mr261018485a.0.1739327321163;
        Tue, 11 Feb 2025 18:28:41 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041e13bc5sm766237485a.59.2025.02.11.18.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 18:28:40 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] MAINTAINERS: update info for SOPHGO DEVICETREES and DRIVERS
Date: Wed, 12 Feb 2025 10:28:30 +0800
Message-ID: <20250212022831.244143-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mail list and wiki info for SOPHGO entry. Also change Inochi's
email as the old one can not be accessed.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..6b79681877d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22097,7 +22097,9 @@ F:	include/linux/sony-laptop.h
 
 SOPHGO DEVICETREES and DRIVERS
 M:	Chen Wang <unicorn_wang@outlook.com>
-M:	Inochi Amaoto <inochiama@outlook.com>
+M:	Inochi Amaoto <inochiama@gmail.com>
+L:	sophgo@lists.linux.dev
+W:	https://github.com/sophgo/linux/wiki
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
 N:	sophgo
-- 
2.48.1

