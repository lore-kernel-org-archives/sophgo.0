Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B3226545
	for <sophgo@lists.linux.dev>; Mon,  9 Jun 2025 23:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510255; cv=none; b=CVe9a8af03vP+HAPMh74f7PekBORmzlC0Kf/lr6C2YPu+ffn3jGD40OI0q/mkKbOnaqXw+UiTmSBHxfumCudjzIaNxTQSeqNZG8w9sESoAGqM0wEvZNBbYdCfwjzwNGf/1lRX9vsZJIz4hXHFcJtw5nNKA/JUGck0hWvMURTHUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510255; c=relaxed/simple;
	bh=f42OxMXtk6Tq+1TWvrKJh3I7+HlxZolNGaiJ+8oR4zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZemCkDWQY4MifusoIuan3ZzlM7j/gr19RNoZgyQO+Kc/2VI8eMhd32ZwwOhiaO1cZIy0YhLDmShNM3XvfvQx5TbKv5YuETUXbhzEgwntt9p+57zqJxiwtCuvgwZzxK7S8QXQYO32L0ptaSjKHEOYCidngw9OyfnGs7QLvL6+7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvL7AnPT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvL7AnPT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so61022365e9.1
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 16:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749510252; x=1750115052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7zP8A986FVen/OszFxhXSFraYygPPRLS5G0kIA4ADA=;
        b=NvL7AnPTmSGdwwzr67b2upKtiL65KErI8T6v1GU1QN3snlJNTpLBxa3TfbzKAVTbsC
         KHE2OS+fj4L/gTjngdgXl8UR/cvbN86H1L+Mm9bcbfpHHU6qjjcjgGV4d0w1IB6BPpOn
         IvkaOLNz5PPlq+EqAAr/S3yKhfNadygsiP/vmKbKHCf49+15veosbzWBpSIpauQRlecW
         Tr5Xq7Io3oTd7LsihQbWFEGXTE9Pk0utIAv/Dh1GdaEBIZG7xG91+mq7okYlyaZ9XJfr
         4/woAlXFSuCppXjdAwBb2um04iR5lIw/VePRFKkJ72Xq2c/53JFvvdb0av21XZce45BH
         6l2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510252; x=1750115052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7zP8A986FVen/OszFxhXSFraYygPPRLS5G0kIA4ADA=;
        b=jJVtTPgTMeFVCIZhzFPoCCiE8h324EmBVZeVy9/ftl+NlL0zz5be9RpCATAOSyfxqg
         yCos0oRJqF2iNCJkJY/dpcnkpwP2E9jJNjY3C+dwo+gycrvjgEa/vbMe36RUBjFV3+vI
         fzL4Arz5YeP22039tl27HxH52IfiOcr3jsCF3BvDl18x2BJJhzUk1s0yDGkTQXVGdLfY
         lhDrmejtyaeoHF4TWEj1oPVOykksrHnVX5LuW0bkHphWYaKFnSfMTf57qoc+GcNc+OTK
         eGi3LVX/YRQbIYw1DfstpWxnMo6kbKAV8heooxAyePJehaiGDUR88Tu+1PGHW5+E3kGk
         vsNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqldCGL29MBjahdrIfLuCuXW1A1hel4fhD59hj/9jDZp0/vm25pSPGEne1lx4tOxppnxNRFq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFT2ENbxYU9lDZGcY2EyAWXeUmNZGKudVabN08qSeRbZ5b3t7x
	/mtRUQB1nwGrjGtHAyEDz99fCOtQYnpukkd5x3BJMSLcxgEY4hsiefx7
X-Gm-Gg: ASbGnctzSvHlWx689ysrB/veddPlrhyNmHd25z9At6aID/fTETIqigryCniDorliZxN
	XO7kmavVZizTyvyg2RbLt/pEAyx8aGKvDg9rucE38XisFaDHSS0mFZ9SZc9/zZZdXZaCtRiLrYx
	hB1DVqBtWNhCAvQIiVa+NqHPOL/FzoB0wPJptVctQ9b/L/7hEqKO1Jnrd5jJB6FANZt1+zRCAqt
	jjkijWr78qPNHgm769ZRDTckBQHmKlldvDzrE/SzB8B7QQl5gyvNML61yNCF5/iCax+Pg5nqMCU
	qkAq6Tygzhw9EW55vSh/M2CeH2GzbpJSmVM2Bip/JOc98ElcHpHCzF4YMvKqBXjdeSaPL8i1/gg
	=
X-Google-Smtp-Source: AGHT+IG6tMFmgMt1P4ISnAtDJl0ny4aH46f7TAhKA7B+gl4vyoNxy0j/tFlOyNulAWELP5jGsF06qQ==
X-Received: by 2002:a05:600c:3504:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4531de71005mr4138435e9.16.1749510251697;
        Mon, 09 Jun 2025 16:04:11 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b92d4sm121340585e9.19.2025.06.09.16.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:04:11 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 2/2] reset: simple: add support for Sophgo SG2000
Date: Tue, 10 Jun 2025 01:04:15 +0200
Message-ID: <20250609230417.620089-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
References: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse reset-simple driver for the Sophgo SG2000 reset module.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..a64bed01d1ec 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,sg2000-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.49.0

