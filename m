Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF773A5E70
	for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 17:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719470; cv=none; b=ayO1/xyEarkv2w4QnDEh6UjnHGzSFRfWKVV1GAhjZF/qqySwXR/4NggPph2VdlmdmaxYpcXCN0Q2aH+u3sdk8HKE9N6+i4Uc14lZnXhl0BgJp/G6YOhzxgSGiBL9ZOy4bWpLN5rFBmBu//XxnBOfPgG8Xn9nloYlEi8eBA/C8EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719470; c=relaxed/simple;
	bh=/iKoxf3LOftVvnFst+ry8upkECO2m/4sz8OzKStj6vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9wCyHgqlkJWcula0W6WlV96ZfqttWaW2d8JgJBZGhNT9xif3rTzAMjby6tc5xaO4Y+vt4yBYMjAgNfc7BKflbcgbhqMMiGDNzLjvAEWua5RctjVS2pnHh6Wk2bsy2/3Mk9x0ttPrJGX+KKDpqUndLysJsQ8nAPjR+hyPemiKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qd7/4Z8c; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qd7/4Z8c"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-509061dab77so27723371cf.2
        for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719468; x=1775324268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=qd7/4Z8cKDNO+TIKJ25PqsagEsXEhXlZld94QryI/0hi4TzI9+FR10ecqEZFIf1h89
         kKIxMK/Y0lQQ2HjyRRYZR6AEgRulEoy9PRdaVAZzVINE6ZHf43CwGf5fPlnICO1pdj3O
         LoNyvLZ2cMlfYegUiuOfEZvbFL4UsbzYnR2oEFlGK7PCdHVNTLeyESZTmFto/mL9ss40
         qlqW49rYRyHvZk6PINEilV/dB8/RpQAa52BHi+jDDDLN0tMNimnRlArHWuaBoUoSL5QK
         z5y+g6Fs1fHgF62mBQqv9gt5e7UHa9iO+XEE8oYoECBB5XoLt8+UziJqVbSNOEu1P+vJ
         mGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719468; x=1775324268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=ZEnafd0BBn9lKo0/neGJX8BcxPiyUlRBGcB2hkIejajADZp01ZJxTnm1alS7sVjYSS
         S5WdWJbrcgDUjrQ/Z9hPLBjlqQazSMxBhQF7ecDO+A0dOrCaUbQzrvKLKdfPm6fL4scu
         nC8g1F3ODvjPmmqK3Cco4NaAdrr67pgtg+toGtYC/NWEbzvbBwb58J8c2sAMSTbuTiQc
         B+8t0DNvTR1+FotXB8mM9Vn9+ejLJNx0Ob+1PGDN6S6HpK8KF7m+hG/2lQHagSooMT2o
         nJayKZ8lsrbmVJFHj/f1mwJPADU+feS9yf7W2nj19UKSgj54BBIzdOZrkyBrRPuOI5iX
         Npew==
X-Forwarded-Encrypted: i=1; AJvYcCUN7abYXiMninYec1SMBmWEdN8u+6eUzyjshx/WjmhKEuwwdLh9NndPuQ/LAMkkTeGROsyERl4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6a62S4Io02Pxb/bA2TqnOp+dst1eFYKwl2hcQXyaLRM55GRKd
	AWOx2ddqEc4MSCykDNg0BTewuy3LJz3iN9Q7cKRVZZH7NfFUG0UFi/TB
X-Gm-Gg: ATEYQzw0DvjE9pGSqlby1ud0cSxt2BgAX8hNLlLu7fLVgPQq13jVEJ3P0MlaV2vkvvC
	X8R3E+jSivx13zujZMlMuNIoOA+vDtrfO62vHh6Mw/KuL9N+dVeXXhOZNgPX8goqcrHw1M3RVGi
	2H66jt6RsBx7+/0LNzivywj2/RIam1c9Ru3eN+S9S9BAIYN49vlkDaXNYwC5XFlQMUEZsH2q580
	H18uKawx5yp79bAhevQkh5X1FgMC2MdPCmMOhBAAaDcSgMmXNZFS3QUY4qRDhB6R5QDHaBqO0W4
	fHKEjQaXYRn8/FNPw6YbCbLM9mS5Kdq7+Gy/OSBqc38+uN9JB52NnqEzxeFgi7uex6xAbBDQiIV
	mykjj7UXF9ydQXcZKXFTGxXnlRb7paxWXsI7feN7rHpclAYyFJD2UKKm7+KPdpyDO1yp50q4Atd
	W68xWksTva50g65s1cn5L82x2nqbXS/WFEaUSVQCf+FymS/wbZIsM0AsE4
X-Received: by 2002:ac8:7f0d:0:b0:50b:3be7:afd with SMTP id d75a77b69052e-50ba39fffe4mr97544421cf.65.1774719468311;
        Sat, 28 Mar 2026 10:37:48 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:48 -0700 (PDT)
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
Subject: [PATCH v4 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Sat, 28 Mar 2026 13:34:46 -0400
Message-ID: <20260328173450.219664-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51f..0b6fbab48b743 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.53.0

