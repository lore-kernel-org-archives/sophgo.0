Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA231ACEDE
	for <sophgo@lists.linux.dev>; Sun,  4 May 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355587; cv=none; b=j83ke97927epS+oFGbrID/VjKOriiXMPoIYFktamEb2ntBxQ/lpwp8cxy6tt3OxPqjfqWTZaibIhcpVi38hSfcQHIre6fArbtUHO2dALSW+U0q+sCH6v43TAR75czndy3m9AgWlq77PjSWwWrUbJLNMb2sVr5qsM7xbpHDO4Dp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355587; c=relaxed/simple;
	bh=KPHrhHOyAQI630w7PvZZOGe3oBE60celgGMAIXnCCGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Co1U97Dk6eJfnQc/OCWTHoDB9vNSSWzCecGxCgQv95q2o8LdLtjqPClw7ihILjbNPsk+smcFXQBpSH8YbDKHQmYBvu6nCFXHQ1XdywPDlD5YZjplU6UlCOgdTg5VDGzJ1WYtXcJqv4LM028ca1kJbka8O3/mFPY+OfFOJBqqoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjd00RAP; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjd00RAP"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5e39d1e0eso389854185a.1
        for <sophgo@lists.linux.dev>; Sun, 04 May 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355585; x=1746960385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luBGFn+jIcsRlGss1jEDVQja+DxK9mYI/muh+oug9tE=;
        b=Zjd00RAPX+xRLONM9D085Vrr1/ZlmJEW6XVgURQYMbMxEDTHxw/nU8rbqhiivqOO3H
         ESNkANoHD0J0aAZMF3gLGYLqYMkajsiUqizKCDSq/iDLz24K1mxZjlqVJ7Nb/C5CyjWB
         FgGr/ddtBQjc/ekpuaRa7QsacEffNrD0bi4m4J4c9taPFAEFw5ycVkTvkaM037zz/S/j
         E0CkKcB16889cMOtF86+jMdaRihGaFYzMixzES68KQx8t7qDny/iNFAPsrznFl+7TSm1
         aX6ACyAlpU4X5W2uCca3+GpvTDUdG6ZLNplQ8jJj1dxHfWo1bBWA7QGT0xhn3jGqmT0c
         A8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355585; x=1746960385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luBGFn+jIcsRlGss1jEDVQja+DxK9mYI/muh+oug9tE=;
        b=APcAySbozRM1+MkRHmQ+ep6hvi/fGj20IXZzt8eWhib+9u6siIinxy2JgKwp/XPE1W
         qvPThWJCQmJHUou0HBo6tBOr9eWFdJZQ4GIsA+B82IGBdIpcVAaZaYklqxuocIthB8BH
         MfPQeAjDq1f4BH4tkXJ6H6H/tcuYOTOUxj7ml0bbaP5gCFSmu3++fN0JS6ie8ei9TNuj
         57txWRM9jMbPQofjHarEfkvF1T5fjz2T7jHadlm6eWBqkjb3KucDdatXJsU/dk37QryJ
         hMtSFWE4E9NZ2i8satwW51kgI6OGo66lC5UdwplWh8puLZilB2Qd479LMkaptTHRpfMS
         M+zg==
X-Forwarded-Encrypted: i=1; AJvYcCVCltk6slJ+SFhpf9oShIjqe5nZ+0PoYBIktQY7Zr7H1Jpl1ouTPxJJY4jWIKzlm11GQiYJ7aw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzySXMpuUWfNC58UNaxZDNzEwB3J/ZPZISP/mVQNqGe9MOV/2YC
	IebJoSQy3SjRuS5FQZ7fHImfhzIvjZWdXRDOtjocEwED6mJdwpFV
X-Gm-Gg: ASbGncvwm2WPuMzTdmwFwh71ojMDXdzgQj/hWPdU2QSgALD9JulRCUfclJE65v5m4Hd
	cKgRyKe6hQd5bxfbkZ8s9fCUu2L9ng/0cB9z44ACOtCAoR716Sn9BK2ZxWjy7w5QvlTco1zNDX8
	/hBry3/SFz99eMS+r5DmCsZNxzGq/JfzhvzsR0DvsritEpZiFrVoz8lz6WuaQ/Dqf0d442/mBSF
	fsNEk+zST6+CYIQGpk3BD4coIJieOSsupa9xiU1XX+QoO1X++Jvy+k32kOOvpufJP4VnjXl8uI7
	VyaVUOyOIj7dcH93
X-Google-Smtp-Source: AGHT+IHc6JO110pytp4DT/Eq6cAK4dWSNom4k7fdULVNjvMMCHikTESlyYH63sW1mFS6wQgaea6AJw==
X-Received: by 2002:a05:620a:1aa8:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7cae3b0a352mr510352385a.53.1746355585056;
        Sun, 04 May 2025 03:46:25 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad242b587sm429752385a.77.2025.05.04.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] clk: sophgo: Add support for newly added precise compatible
Date: Sun,  4 May 2025 18:45:51 +0800
Message-ID: <20250504104553.1447819-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of device id definition for newly added precise compatible.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/sophgo/clk-cv1800.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
index e0c4dc347579..a4116ac1adcb 100644
--- a/drivers/clk/sophgo/clk-cv1800.c
+++ b/drivers/clk/sophgo/clk-cv1800.c
@@ -1519,7 +1519,9 @@ static int cv1800_clk_probe(struct platform_device *pdev)
 
 static const struct of_device_id cv1800_clk_ids[] = {
 	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
+	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
+	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1810_desc },
 	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
 	{ }
 };
-- 
2.49.0

