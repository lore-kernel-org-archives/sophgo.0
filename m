Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04F23E23C
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814445; cv=none; b=djV3hoFZVBpDpZQ3UGCdZbg6Nq0Rh00BJW7iF2A1hPhjEGeS5XVTi12yIC9AJfGEBt7f1uRilpK7vTv9xIWCtACWynn4KNwl6kJGECTRwfwkkfouzydUo7NWd+CxmDD3698yIxPQOXNgwyTGQzTJxFLMRRJlHRy52sM7vUpezn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814445; c=relaxed/simple;
	bh=wOkhR/zjvIlNEvtsTp2WKg+AVT8+8Er4BolkshuW44U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvOqxk/IdMFM5oRmM/3sRIiigyv93JllgA1W7lwxRXuFraHU0BlmucaOZnVPSqjNxSFvr3JLOSg7b7sBrMnnJmFcMJF8x1Mj0QLOQlHjeY2VkUxoazCaeM6tZknNyy4UWk4tyZOTq/B2rA1RA6gdOZZezRgZDMDkHbra16ePbtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL/OlLmR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL/OlLmR"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30a8c9906e5so3116628a91.1
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814443; x=1747419243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNRo9fm7iyINTImWyidU3KVyi4MQmQ7f0YzWwyxxaXc=;
        b=KL/OlLmRphTHjoiEmITwiupHABC9jqsOHSFKmGw1vCVfyrs7a1U0Ti7HBGy6foCeLX
         HLU+DE6O2Ixy39ibVBBmK7+lgZ2kGlC0UtaQg26NDP1cM8pClvmsew+WAfTUjVqZAklC
         aX8LqKXv3I+4S2JTPHif1gvvONvUovkRHFxlwOC84YHMCLK9WkiTczlRmzzjHrXOj2Zi
         bD0x3s3cQrBAwX69esWuMOQZK6DPCd4bP8nm8KzdYBS2ZgIBxzHzk3cMoOWwVm2ooj8X
         fNph7llrz5W4KWTf4zJPE/I9tIot+tyuPqw8lmUAy1qCgpRfj8A4WcPAQpckMJq/NHUw
         ub2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814443; x=1747419243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNRo9fm7iyINTImWyidU3KVyi4MQmQ7f0YzWwyxxaXc=;
        b=Kn/P6EAJlFre9aDuXeVh/TDy2FOwQAodZGtqX97UlWLheNQvQ5R/sdDsznRQzy6G5j
         PT2lcTId6NT2AXrcF5enTup3Bnk8CEd6m5I6qsruiYN/462Y+1CAnNcaRvAeKEc2/Vvi
         k4hazHdvZWbHak1jpSl4uN4AxGOd8EdFegWZo6PGhkmzYPdnaVkVsABVAoHmgcVX1kHW
         Y5uffnBO+ut7yqfENsqBKsk9yM7UEpAErtnTyMwhDshLPBpVyJkf1bmxXIYyEvWXJghU
         8lC26eHGDRvhJhzRft3lJzqpzGv8hY/TM9fnGlC5df6n3+kI3HPxo3kXJx9ufzKjTGUj
         ZFhw==
X-Forwarded-Encrypted: i=1; AJvYcCWSZpnZV6ylxPfRv+lHyFoJAVZ3PG49PziU9gB4JCaVQZz/kpiK4SKZpc6F5VNauIp0bj7l4Is=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEextqW+ZF0jLzSwuYRgWNzJxthsNRe+/2/N5Xb2JvNFnmAwio
	nG59UBnRyZcopaMxVslJ6by2IsEaDoN+lBXEVPaT1Sdu3Zd2aEk9
X-Gm-Gg: ASbGncvFVp1Fs5VMnMWcyDxctuNB1cyRpzDuofokGZwlEp0SPp6AiBVo3CZyzGN2F7T
	ZkeMPdu3q8mwLoD1+GB2lgVB7OWmUlxHQZr6VTqAnPIKbivE1E7TiXkEi/km8Gw2KeQJ85UVap5
	rbWTILqpOISyuQRSUE0m4K6TwYMvzgnCatXqEg3Fgt4Fm2hFz4+WIL9huBARqm2hGi1oRMgSXML
	5GE33dcixUcwbkoFyqE39pi5pekmfBAry4gdL6Pe2SuvMPnpAC7DY9pQ/LpD8pLKTfd1q3PkvLm
	O38kFtZgdJUxEtrR/XJiNX65PJljxcb/Ck2swKL92Zvtb7pTGj0=
X-Google-Smtp-Source: AGHT+IG1IDbBo8zSWgCQ3XPdci2C5OPmRAXOekINXprX8tfkSAK2JEHQY3UrbKWp96pgR7JLi921FA==
X-Received: by 2002:a17:90b:4acb:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30c3cefe24amr8073503a91.12.1746814442868;
        Fri, 09 May 2025 11:14:02 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:02 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Date: Sat, 10 May 2025 02:13:27 +0800
Message-ID: <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746811744.git.rabenda.cn@gmail.com>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for the Sophgo x8 EVB board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..ee244c9f75cc 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-x8evb
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2

