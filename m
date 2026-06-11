Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8000F39DBFF
	for <sophgo@lists.linux.dev>; Thu, 11 Jun 2026 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208853; cv=none; b=c8QxIkYTDYY1bEPelxcjdXkE/kCFyS2ltrprAVINPRqQMUJMu0pNbLvQB1SXxMiPdrJhX2yfDuWv5Y17veJDv9qa9XNlmUZ/q7EMThVCBugFVxdzEVd7asrJDFCHQ1A2CCZJiJfzxWPW7ixwjWTtV8IKRDTtUTtiVEOu2lek+6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208853; c=relaxed/simple;
	bh=vzqxvIv/Z820msoDS14+zD5u3OuYC3MRZkySViyquOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDbWfy2T05r+1e6qPyYDWbUXLCW073wUvucT5yJCFrr2g3uI0J+S6YZp0S9YWxSmcE5M3+sFzfd9ogiJ3dZRaiWDihefb7gIFzkCl1xNS7jk+vZL5K5/E9zWtdKurRyLH4QxlYd/7gmtC2TNgTwEAms4htag4cK3oB5IpxhC55Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QL8UTyho; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL8UTyho"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c3543590so1971875ad.2
        for <sophgo@lists.linux.dev>; Thu, 11 Jun 2026 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208852; x=1781813652; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UogjurmnadVGaEybH3I8GCYhGRY5wKTkofTPfwNbdk=;
        b=QL8UTyhoa1/LUtwgd0mA4MM1bfni1DhfpIDJ46TVmmRuzyeQARD4sbn5V851kEbKPM
         bBrq3Php60V8NBc8V/0y0G+pFBO2L8G9Gooz2WdDRv+f2k4YgxdpUAaDwlywtqCrFXr7
         VJib7DIpGi3chmZNYLm6zX/B7hH57GFvUVqdQAB3NUjYUked37iyKk0TRtF0W82Jyu/C
         EkoVU6aQ5NtpDW0r30CF2RYawnsptF0Y+uLPEKfgYvNiTU72f39sP26NpvyFgw0UCgZ6
         yNZ/A2F322h6RUM0BIEqS4DYDe7xo4nhX7syChPli36zocwaU8Ledno3vzsU+dOvzKcA
         3wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208852; x=1781813652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+UogjurmnadVGaEybH3I8GCYhGRY5wKTkofTPfwNbdk=;
        b=K8lk5I317Tx3zVyG1w63Lfx0wlKK0JY/ixynxf3NQW/cmTtMlka/B3+7wRoEGfSxE5
         W+OIF+YbrblOHlrSdwaqkdILVgw/yMyrNINH5jt0A+n/xJkF4TjPd1iguIsgnqJe1zlo
         /uRN65sLBTSih9shW+XgyJwktJrkUqTp+dXB4bfBcWKsimXyurh7WwTx3DbcHRCi9BCi
         yBoekm2ACArOZVjw5/2RPNu1hBe6Q0oOf8aBJw8j8svki/lddb62j5jCpvEn8fVt/lAW
         1MPtYMkXFg1ivsXqtf60MQsvFw2jPEaPxFxkiibx7a1Buczno/0BL9GHu4+r8mGaVbHt
         Dclg==
X-Forwarded-Encrypted: i=1; AFNElJ+XacP8U3GTw3PQj54YWiFjVYrEGBcGbn2X9WGilZtsAg7IffeFKKk1gnraaf4Hllnd3KyGaS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKichZWQ/pDp9DrKKzsimQjGpVAwzCZrBBFSfHIMsLQwEbBK8P
	j4lqDIkbpVzUEbIFaEvg4AvqIsagt0ykZXTAbytWd/YOErVkTHcVzGkp
X-Gm-Gg: Acq92OGMlM/NoVHufBiWbgLiTPqjt2bCAD54BprWQijaYJIYRc6tKftilIX8j/UXvEM
	F1yyouAwM/wPS7v6hIxrGf2H8R9CgKKwVMVOzgCaa5tZHh0cMDXYQwx1rSO3liYwxmHWRjbTz5w
	bKVuiPNCDfxbr4gzh4ApK+/hADzfZRbON2cs2fRdTefAyK439X3rLf9S5MJsVOd6fRXigGSGSxy
	FDz1ItdolTGIirqhZ5089j0sQ2C9fY5d4bH5cR+lw/lbU803AfCR9srAoA7gq0Y6EDuJ9Ej/kVw
	cZLfzl4xXeVGC3Q2D4lV0arpkqH6XSqCs0V8gP1nB0tZq31R9hZIevKnwMdnsUlhFG+FoG4q0Zr
	urh2fctHfQ1ksblDvZoNSlbmVVbWGegb+0w02L+T9Hw3oDzWCrPH4eAnKKpHwJHlMavNcnXFQkw
	==
X-Received: by 2002:a17:902:c407:b0:2c0:c625:4010 with SMTP id d9443c01a7336-2c2f2d5b823mr49982165ad.32.1781208851778;
        Thu, 11 Jun 2026 13:14:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:11 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:45 -0400
Subject: [PATCH v4 08/16] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-8-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=vzqxvIv/Z820msoDS14+zD5u3OuYC3MRZkySViyquOA=;
 b=kA0DAAoWgrIluVNoGREByyZiAGorFsGj1LKmqSZuxM3ds1D1JnMhsEQYTedSZCio+Vjz0G5Wp
 4h1BAAWCgAdFiEEw8WEa7XqTFtN5wn4grIluVNoGREFAmorFsEACgkQgrIluVNoGRFeTgEAlm4q
 TS0RrfZZaJySqif9VGXq49FSo90l1aGtPT74WfsA/0Z6QPZvvgDRClq2yD8QKSJAIMfvQbF+DxU
 A/TYM7CQF
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space.  It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a  schema check
requiring any present cbom/cbop/cboz block size to be 64.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..1c24999beb59e 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -494,6 +494,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1142,6 +1148,20 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
 
 additionalProperties: true
 ...

-- 
2.43.0

