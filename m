Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB2B266F0D
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425021; cv=none; b=WmeeownTWvhTvp2k7VN1tOAcjWwSQarRov1NnQjJ30GjlTa7NdFGfIV9vaSV6NxPh0jY1S7DJBf6RTQaGcCqPzEoOQ/A1/55AkhP7fCDu534c3HHN0VBFJLQJb60YTRjhFicKS1i3VJRIVustrYxZbAvj7/DjF2Ot4PMavcaD44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425021; c=relaxed/simple;
	bh=nArarwAlz2lpSFVw8+fLjNwR+Nq2mIZBhK4d4N2fTx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pv3vtQU78iOzVUnEi9qXTWuwW0+RYVPRMB5teYK6CAh4MGkbaC4TC8OOzRQ4tN0og170p6zqfDJc5F7Sa6DTiT4TMraltHDI0k29zqkJ91hLYcf2wLJJQLkIwojl/3Os8HojCdFpsxWZ7NwD5vjRV8bm73Jng7Ya/CcvCVWtD6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAsDPRKc; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAsDPRKc"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d09a032914so298343485a.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425016; x=1750029816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzlaTY0tHdKvyrCrJLv+ChjIQt2LAnmKHtpsPVtNlOI=;
        b=GAsDPRKctffisYTaWjkgPFJaqnK5bHwgZI0SZ+PWhShbDtKtPsfTEyQyjz1MgCcYFj
         wFRhdlyEZWWwBoKnfvIUwCSpVhmJh+pYX+6fgPWOFRlGESPDK4upTGhmi9Ap3GPCIexl
         lUxRq2IjLmYw24/pGv1e++iJGMYxyiMBcj5gm9AqNkyttnagmPYXbocsigbmsDGZhdG0
         Y+HmkCG+EO3d8zI1XgKNmKcDCKN2qwlxdipqSO2G6ZZ3DZNqTzalr8H3vGaL4x6W3d9m
         /32feWNJGo83dwzAp/zKKiHxETPjW8adY1wBTHlg9usinMF0XLPMq1FPeABaZ6dDw33T
         XSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425016; x=1750029816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzlaTY0tHdKvyrCrJLv+ChjIQt2LAnmKHtpsPVtNlOI=;
        b=IJ0UN4TAXUEE6VRmr3jON9hSKbxizbD8MJrr4AnqnrNFbK62/UTCzduWykTvtqA0eX
         iBZwatsnZ71lC+EU8UUSfkVBy8Vw5wIqZ1sXz/OpWgfcfJSfzlttrSDTFeeu9yQU9w9p
         cRbPaPEBepQ0kcc3b9DfqgnV19CiFYMOlTOOtLTk4othfuXFc2T4AdZBIqVjo/2YTtB7
         +hSnUkzum032rXDqG01DTODRWvsza5tzYjBAhOHswLIo7icwcrCxcqsy6D94ozgHy109
         0VwRwHNKw+eMUGA5ynbvGnCEspe1g6d4hWa53q30eyd+iuaBkLyrBqPYwptcnmMgBxOr
         SDWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIURee7QZ2gkKpNF/WMTdn4NQ7N+GipZqAdGa+YtPl99QfUH3x/Zdmghu8K4mlLidA0iTVo+A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYuaGubq1iIjBgjBT7mNYMEiLHW6D0DNtVn4pMvRLpntu8lgto
	cOq7HtDVb4C+zxLFFl0ZtSMEsMggqXrI/DdlIPH1Wd0ag2r9OQbMdkJd
X-Gm-Gg: ASbGncsu4Me3FRzi9rklzK+GUQEJXAmycR4EU5TDT0XKSpSJ5+D2kQ95rG0KpN3vWlg
	46EqWwXkeVwPy1bAOYeIXSVAjbtkwYM/UPVFr9f++Cv5AzPZcAMPiluJAJEChFmqXDtNm7Ih7ol
	WPPLexP+E6dFVCl89yieXcKoJ4bMBIxTUC04mq+lcst52ICrDvskkAI/n/4mH8GYsGv15WLFdit
	c9F83yA9aGA8BUgDEY6FkYBMn6mSEHPfa4pOW4A2gLtdKJ8LPqFXXLtlOAXjBurYOGtKUhzI/84
	bPAGfXc8lkqLBYe4jiffl39iOm0=
X-Google-Smtp-Source: AGHT+IGjbwg1Bauz9LJ+K9RIr3N4RPJEfKPtO0PGQCVeGinq1IMDmYmAae0bHoznkVtegbGh0XJUbQ==
X-Received: by 2002:a05:620a:198f:b0:7d2:2673:883a with SMTP id af79cd13be357-7d229874d7cmr1953579185a.7.1749425016456;
        Sun, 08 Jun 2025 16:23:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d250f64b80sm466522585a.23.2025.06.08.16.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/4] reset: simple: add support for Sophgo CV1800B
Date: Mon,  9 Jun 2025 07:22:08 +0800
Message-ID: <20250608232214.771855-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..79e94ecfe4f5 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.49.0

