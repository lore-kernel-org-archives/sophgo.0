Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3033B38B4
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162534; cv=none; b=c+yWovgEfLaOt0sH7DO+VWi1jQ4GU7v7rgTbalnMAYOlMXPh1ig5Q8uBo7iIbhTaZUyJeSCtqVRNIjn38jkRT4KTXaTWw/U8b/5T6mr4twnnPkU6sSCcqsVDwkIJ4T56m4yHE5yC6EGR/BlPB6rWDvLcASeaUbvdqHbwm2OwSro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162534; c=relaxed/simple;
	bh=cmszwX0Ji3XjQt7Fpy6t/qmhlzCiNP9RsFnOxecQxzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpCoHgL/dtHUbla8xCsEyI1mbUUCl8jbCOJFP0FxTo7a2jVXEUYNP2SGrgGkTdgqpI7zmpFB0M6b6vB5ifAoWYU+tA2MWoWcKVMkaYXRt+76leepf9S9pAjmu62faz1sWbVobcn3257dHOQNJb+neztu6ykkEe0N+38X0Zb3F1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdvOuCYE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdvOuCYE"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-914b03e42b2so1081996585a.0
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162532; x=1780767332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=pdvOuCYEcnWh5dTohyIdMaJYfjfWFKdwp4nz4uHU/8yn11hBkw+70nSunjd6iKySRk
         9+4CmL3m4CB/58p/bzxTVzqOJ0fmYiWANy1kDn7GxtAgkHYU6+2Sc4yyUxhLz5r/fF+b
         hVm3ELyoi3LF7uW/Gwcu4DUeStQfWBet5wWVdr/o4eJGF7j32Hyl+OsPvx1L/qs+JuRT
         anGkYIBw8jmRF7sd09lID79jePSBFfLiQJ84iTeYU/hRdnZqje4Mzdr9LrdEbovfAo1q
         4TYq890ibzgwQmHL1IrRl/J32RhXCqCcjsowupTBA7KWx4H3GoXPhUbVjU+TERncdeMK
         qFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162532; x=1780767332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=Te/eWeJD6mqrEQWjx3Z00X6mXHBickukPr/HyQ2PZWmy5wvChTNjcsaliBx1BcXuOz
         Sq4qR/bYtgbcgF2AvmiGKKpuPC/Tb70O3/0PMPzpSgKsTbcLG46nArB3z4VIO7SxDlS5
         W/27rMZSL7biEqzFS9CLyZU3K8/pvcuCE2LGorWsgXVan/1bV2/3TVuxh6zV1s5FT8E/
         Nnlu84pE8qLap1EmWLX8D9TLaPN9rxHn5oYyZSDO5IAy5DV2MycxNcwboFOurXIvdBJU
         Yd7fWu3NlQPDE3KLmmNToYJcDWqAWcAqiF44oLN2zBZ5ynyJLB4RZ3vEWS13keHkcXmQ
         luEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sCbs8alnSLE5cnPYGgI4bJiMUQMvD6xNBIkv+v0UUc+VWFm07z7pCEuuzgGRM+xEXboj17tM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUVcw6r1QOqI6/Ghp6Mdo0Erz8Z7xATIJZg6AyioB8nNWdJshI
	JTOxuOs3n8PQoR1mG8xF9gHrqlPboNIgguEBh2LNPdiira5AU1vfPk2b
X-Gm-Gg: Acq92OHyLrnt/hFTUC5kC6Y038ck7BZa9V+PjjfhBXHSoZt6/fA0MTWm/l7p3bUNk0z
	3bcyhsNjtPfkn3p8f//xC3F1XXJcp5IzAd26nA5Kf9t5NZTCQP/Y8iiUbjNsQ760pD05jUDsV9h
	IMw3tRBOyQUna+r89eZ+h2cPgwHcVypfB48X5qEXMxQtQCh9OLQ/tajHT5RNFSS0fCPe/ZBZOyA
	zEsbLVhnIEK3jLS1eOi8vglPr+NmuXVqovxGyV3dlQYCP4YC8u43XQvrjzR4rU5aOlPrlvNqy8r
	FsINbDbqD+R8WCV0l1ohYRBQpaEC33B5JzW5s+ghlwXnfQSh56HE0DPHkvh7oqu/VyOliL7ynxZ
	TmqztBuKVgNCInnORPTuKBetqda0oKJV17cQ44CWTTSldHR2N8eTDAlIyKTDVqXZUImcIktpE0a
	ZhRs5mDIQUajyRTtNbAwTuSUwbSCVRRo3QldtTOVJoaOpGr4w09kJ+qDh0nzyCBwDwQLo=
X-Received: by 2002:a05:620a:4510:b0:911:8e3c:f165 with SMTP id af79cd13be357-9153d99ebdbmr687805885a.19.1780162532103;
        Sat, 30 May 2026 10:35:32 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:31 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Sat, 30 May 2026 13:33:45 -0400
Message-ID: <20260530173347.33533-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the sg2000 interrupt
controller and timer.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887ec..decc43df3c839 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -73,6 +73,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9b..54266b3c2a185 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -50,6 +50,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.53.0

