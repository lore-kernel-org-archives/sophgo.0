Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E371348A2D4
	for <sophgo@lists.linux.dev>; Wed,  1 Jul 2026 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910440; cv=none; b=b0+BurhfcLl918IyZsv9s62DAZD0i8FOmi17+ooKdVKhJT2/lC63nJJc9K34lRfzOMDwyeuxSUqJgrLTKzSz2mvTETJGb0usjYJb64tCB2Ouc7vav2PYc60ulMXnHJgWXdnU33k1Q7bWlxvVajOQfiXQUV4o7EVmP232CZw9paA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910440; c=relaxed/simple;
	bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9SBKWGP3hQK07hRqDbNXC9TolgPajy8q+60Sq3gmHFrhqnngVzMAyAMmDeqlTKF8O+6RRvCldEZWsNPjlG8fGMQrC4AUCMZwmm9dJ8+U198ped01F1aF+pFreb8Tqx9p87z/F1VE1IqcbtYzVC6HFJevChnCrBcpF/zcb1muqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G21mey/m; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G21mey/m"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84783bce476so507714b3a.0
        for <sophgo@lists.linux.dev>; Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910438; x=1783515238; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=G21mey/mX+F5/z0eh3uqDI/tHz0vMTCHIyBl2KFe2F+qm2U5IqPGQfo7kRVdFpHlW+
         OzNboFIliyfz9JFpmJf9OLAHq4zd25uSIt7GoTqeLhltN018SaGiFKq+9Jv8vmvRZxn5
         k1IMLtpysosYWhBI3jCi6KeEDEH9o3WqS7cDL0i7fEBgV5z+HvwRmiungyf5ug2r5Bfd
         VyWw20de1bDPrZFwMHaGfqnhBhpQXqMKck3gyURt1DHb7c1SPxqWPFtmiIF1Kyts2f03
         QQM+KmiyfuKYDUJ05eJeX2P+nUuBIoLHnl201P0aVkLR0mCZh1vSK7QkuDt/wdKykA3q
         +pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910438; x=1783515238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=cKEHz7kpz0ScaoZtjv5ZSJ0ZNYjd0w5OX6qrVByKDtwNFxntk4fmKA0sNLXktjdD1N
         rqAdGB2C0XIq0su+QALwz58ersLar3buVJI/SwZzLiKUlRPX4QYm5sYRfpW2wylyRucU
         7T3X4X0JE4YzMjoL0GOvnkC3D9Qc/iICsXP5o6q5dgQ6CuCa3yA3p1w2WrV/PeXSNmUX
         ruxk0J3ndoH91ubu4XSkOBKmbX3ql7zGEwyJmFUOFVNHnfb87JwyQILB5t3rKTQO5NzR
         cHqmZVmjYHTID5qHP1PGIwt4cvjsi0XK7jjO5bm958LTSUYuJMh2HQGvPK9Bil478Rxi
         C/sw==
X-Forwarded-Encrypted: i=1; AFNElJ/w8YtA2rJ37aWEd20zc/4ILYIKyFXpbMBJnHTl/3mFt+BjEKJchG61sKz3zJmULw9196qXRkE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3YQz95IA9Qxuzs1Wbd3PzNkFgBknyf9ApzuvmSlcc/Acqd31J
	1uCqQGCjFiAzzmuj2r7iPeaUm7AUz7+RE6xrmaOmhUFRkov2LHhF0FMl
X-Gm-Gg: AfdE7cnWvmP1PrGkJ3hUAb70K8qsVtHQ84xtyLROL6+gUTORr7jGi0wCnKbkhRVkXBd
	twkWMbJVGtAO4KdYuCeedsbTQqKO4jc9p/he6t5O7SPN48qrZANiAYMwnMQw/3tl6MPwO1kLC8Q
	dc6wG0xpsCaYZhcpSGsXwRMANpYx7Dbj2oas+rE70Fk9jKV1FyyO45NxWaRrFnWRh+tXZKjk6rP
	/6O4oLLtz8FwH3MdLHnSYHGyVToGSWNeZYZ/VtmWZun6eOUEIHWGlJ4fQQA8mEr54pSxQhwdle1
	N1er7WNln2aca0we7GrPLDuzmeYbCk7ZBXykKOjGk+PY2JsrKhhyiSNAoLEpGJdRcrASA7zyB3m
	UzJ7wG8vuG7qsFobKT/1hXAloHLjiRabnOJcDvXFktS3WlIHPyVeNqLDcOJCaX70UI4zZkVBzTU
	zWsWKKaxdimrcJ0lgR+4xX
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1460384b3a.26.1782910438134;
        Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:57 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:21 -0400
Subject: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tZJ0Su79v3RdX58lNmxpiXmJtcKlQyZK/LSqzvea
 TYzF0p2lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQkuxkZOua7fZ3pvVejxeEy
 +4eeNdKc7+brz377VsVu1amK7kMbXjH8007YqzrX6+sFsXM73URmzGLLvRK68UNyxWSL+++Ufmz
 W4wEA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..f4dd34d446c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1142,6 +1142,32 @@ allOf:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0

