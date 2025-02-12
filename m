Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522CD1F0E56
	for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739353334; cv=none; b=XhWOaR6yGDSb8xjKcOxBD7Quu9mEUR7+/dywJ3ugpxp6rQkAPW39hHJef2vOxq8ScTl6FmabC74DWjiWYiC3jBu8yhA2miBLOaEysBaVk7tkAI2qRk+Xhm2htzAWSMeXzdL3cvJvm/UR0XGSUFiT5ZHycgda1Jts9hBK724c12o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739353334; c=relaxed/simple;
	bh=vqZjphjVCvvimGTjuWEawAa6X4Yyt7LDLgYaLojwoBg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kYmaYlvFw3pd25SwUsnZ0JIFIdcrq9h1qPvLeyMduzqZOUA+pn1Br4sD1ZfWmlwpEI/IPkW/aRkZz5QFuAAt0E23twlNC8uXlPxqLRSEXjyeNYrkszkPYxFskY+0OlkFbvQplKCX5wdlhsqyMSOPj19l3uEHAqNv6ZkMXh9dVBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4xePRwe; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4xePRwe"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f3a6ee569cso968852b6e.0
        for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739353332; x=1739958132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0SNOa69PLoDhh24/938sy/j/EaHqARH0GqI8xpTJeU=;
        b=h4xePRweFgYznAn5zKqwO5UN5nzoUVEdCVRj+psrYxIIEGIbDy6r5GZJrWDHWtFde7
         PbAl/lg1yCfVY7vU9xNZj4VNpPqc4SaXM+dTvdgettJMDcLOcj9GsnRKGHSfxKHaDtTR
         MTMD8hXUlb8AZVkB+Nun7Khk17SsgnbLpR8+oY4bYLjWfsTPzSsmaYnX/Dy4aDeHqdLW
         RlDIGWFUipXtTpbBDULIyM89ekICsmTPH6cgoWrLV4hRwyVxYuDI3EETx1sMvSNPNcbJ
         gA6tV76sIFvLANn/rkW/JBUESFBGRtZ3KcmzigI9AQ0+NV+cU6pdIYMzQC3C+bEOY+Cw
         jU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739353332; x=1739958132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0SNOa69PLoDhh24/938sy/j/EaHqARH0GqI8xpTJeU=;
        b=KltU0lbEN82L9Gd6Zyn5JAf92Y8PYsvOVORF2wZECHjjjx/dU+XT3iVpI9j+WVAFHJ
         w/r2o38GS4SbA70pd6Yes+kC63xt6uCLwKt8alG3xGG6fALBrSfPsngHvjpGdfrkik1z
         8nz517SA8s6NSncSrjEuBy6xmKW3yOMxdY6PhNlBnzSIrv2SggE39TO/J1Za6KyUMtai
         129wKUv9LfuEmd5Ha6yF2OLaO58bina1fgKEN5/fBDbBIWE8fVSCS2R8F52zSFjTyd4d
         kp5zWf25Oc+5KtKnr2OhPQ4NuX5/pu14TwYLpb0KDbOn4IY7Q2NNn/Tf1q3VLIMoaw2A
         rklw==
X-Forwarded-Encrypted: i=1; AJvYcCV8n1Pa7puQWlyoQ6V5LbDI1FyFuoMwT7AtuMZSWBkCvdSfJ+pLHK2VzN0A/d68h6Y2F9DDIlc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Md5J0oTlbW/x87U2px5JhTetjSqxDhdZh8w3WFZsG7sU2xa+
	RM9F1g0Ozju4QAx+gzGC861+YcABPkBgS1eBqJnqltq4RqdTXqza
X-Gm-Gg: ASbGncve53J8jKK2fBKfxg4Q7LT/ge/BAckiVWDcDY5bC2pvOKWPSB0ZGCBUD1G3UF3
	4iIZ5NWfRJhzAe1zp4TsKzQeru0KWu2bNY3lCCtRERKyX4Fk71srd0yM6sMIv8sohCqPZMz8Dnd
	lJjZf9OFjeeZ9O1Gcf7WsmZ53VhIFcVwT0F5OnngACKtY3C3TInuWtFkB6sLdaZsfpBA8bxMJa6
	czzeNKpTu95UfCU2ht4YuRNotu+TF4FLKOPso8SFVY9wDfUg+k7Rd29Z9sthRzT4hJ8sRQZCQ+1
	fw9l76rBa4icXTI8ri+uoL1spw==
X-Google-Smtp-Source: AGHT+IFY7RRL56SET6zwjdVg9vVDKQYGpxNInNa+Dsu4BPAw+Y3SHcAQvuUvGrIT5JAFo4U62eduNA==
X-Received: by 2002:a05:6808:2187:b0:3f3:ccb0:ad4a with SMTP id 5614622812f47-3f3cd70d9d0mr1961675b6e.31.1739353332373;
        Wed, 12 Feb 2025 01:42:12 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f3c4735c24sm1583180b6e.41.2025.02.12.01.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:42:11 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com,
	inochiama@gmail.com,
	sophgo@lists.linux.dev
Subject: [PATCH 1/2] riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
Date: Wed, 12 Feb 2025 17:42:02 +0800
Message-Id: <dd23362328f77dd91aa9354848bbb0abad0f554b.1739351437.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1739351437.git.unicorn_wang@outlook.com>
References: <cover.1739351437.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Milk-V Pioneer uses fan as cooling-device, and speed of the fan is
controlled by the first channel of pwm controller of SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index be596d01ff8d..74c997ed8283 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -73,6 +73,13 @@ &uart0 {
 };
 
 / {
+	pwmfan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <103 128 179 230 255>;
+		pwms = <&pwm 0 40000 0>;
+		#cooling-cells = <2>;
+	};
+
 	thermal-zones {
 		soc-thermal {
 			polling-delay-passive = <1000>;
-- 
2.34.1

