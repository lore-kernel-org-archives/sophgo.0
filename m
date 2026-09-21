Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C8492E56
	for <sophgo@lists.linux.dev>; Mon, 21 Sep 2026 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003362; cv=none; b=H/37Z01CSyCtgUYxRukIhFv5M9ngRfaIUtuKBObtdMgnW3MwycpPPHBUdKT/jQGe6ORojmYjMzVQaNU2lrjQCxwKID7QuJbSZy+Zr4qWUtHYCVj+7TAmNCTA7ZaAPPPOFk/QJdSX+eknDq1n1Ek9KNCiIEzhyUTH3sLOXeU3FWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003362; c=relaxed/simple;
	bh=2hLVo973TL+IdDgfOfnl6vgwTnq6FuS1dy3gn60sYLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcjM4AXbDQhbEfySLLNEbibjgAbnyDvjDqLqMbfTP0jjHz8fS43EdNLd7fZR/U8WyjzUAHTvG7HkXpu9BYGkoXD6f9KNMHNRAlSBQUiO65O0XSl3wW2EFNVcngdz1epR9Or+N3bw90xo8L8NRRtKCOKTxv4ZPp7A8/u91Ec7MF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nplcBhAw; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nplcBhAw"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so23678525e9.3
        for <sophgo@lists.linux.dev>; Mon, 21 Sep 2026 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003358; x=1790608158; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=;
        b=nplcBhAwnxw4pKCB73T7gPItShSvj0yJ72hITh8mhsFlNDSdkLRg95xIMazbfdmivL
         qad55A2g1pF8WJcamuQvF+94BYenY3rkNoHw7u60Ix0jT3r1UemrIuwvKquXR/MqcsRq
         juAuzzSil/MCtXQgRh7rocxzCLOaKLq3TrGpfWoKurmPnEQH7HXW8vBeqXJ6p6fpB9FW
         FLZyW3uosMOZdkCz/5chwXxnkTb6+lWd4ux1uiWfgbtqchabadA9eGt6iSd5CrQu3pKv
         CSMkckuxqaJfPCTF6Bb21iQbWLJuvKVnRQAt0IJRlR3+w93/nlGaa+GNaYXsfbBEZwsh
         iN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003358; x=1790608158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=;
        b=kPV7c+l9gx13TQXGkfayAdj8ye3wwy39ms+OyuKvmFXKEz7ZZGh1Cr+nHTTVdcIoS9
         aSJBnUUELuKNAMTccL9mTxi8uHhseI3Ho6gdrSIlrMA87ssIoFKbAhmbLoLpNqdlUGUe
         E7AmJ0Tlb0tK914//1nU7Tgchm9Cw0D0EcbI9sH4/yYFywmWq8ztnrDLt86yxip/FQxg
         19XtLZ+7jrytlNj0O8A/QEZ/czDtOnyU60TKdJENsvDvljV6eZ12dJJGFpB2QA+qgAFm
         t72y9bzozbW8h64MgyqwjPGFTGEVvAPhyZ9QpRAkWcvbjRrt5XsBFpz3My0i+5QXuW2j
         iapg==
X-Forwarded-Encrypted: i=1; AKwUvByBmpQDL/YohTjw2ezmTcDm74dKv/4RoHEheITTPa8DD49ndWyfzPF5JmCZr1sPtxjD/Zbo7Uw=@lists.linux.dev
X-Gm-Message-State: AFuF++koR705NE+kvbrSaOc2N43pE6YxjyHOxuLBlECN08cmRwuWYNOs
	h7XvMWJKeADBfcbo6+rEwwA1UjJpypTeWWoDnF5lkHgI49F7KWUIsFzl
X-Gm-Gg: AYBFou3WqUkoEcDSzHWQVw3G4tqJR5R3OgLklNJfIj7cexwX2LXQuPBeUMfiM1uLx5E
	DPCPOnyRcD4czyDaUPZyYI7qPRKheqGlv7//n3fWeixIP9BXR6vkQuDe2viVvx17WxnY2LYWkXG
	d0R/UrYrCmUS/oaJGd6OFRKYUFROg9kKwF2sOlhzdrQtv3GdA6HLfOxvR89mmFxy5rIFYih4BBj
	1JzfIx/9lNbNga+ey3SsLGU957ZarHoGdSsT/Swyqlebi+4ojo+1TxJhifTIgJQbC0MFkNu4vNE
	Hn9vFkj8prTnJPfcuJ2H6/QuSLvz4org3NyBkjHDnOa5yWZTtMdXU1w5J9YEENtn9/2S0rUvyQ9
	p4CYqw/VYps6mshYYJIxQAcBXkuqbi2t4ESpV7w2Uj8ClZXSoEabXg864x7v1u4BMzGMhI5fhHp
	Re34IjOmKfz97MS3VS/scNYD32e9xrIX4XCqWb3rcHCfJpdlehR98PRMzk1+JLjXUK/uN4TALsg
	gVHdLAqCZi9qGGxAQQo6DEUqYKsoETYMIXt8cr1Wbgke+8+lfC1mHZe5BVMJYcQf4TlToK/qfKr
	tneExVsBiWgSJxXW
X-Received: by 2002:a05:600c:3b04:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fc56aab52mr150433145e9.9.1790003358551;
        Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Mon, 21 Sep 2026 17:09:00 +0200
Subject: [PATCH 2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop
 reserved memory node
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-2-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=930;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=2hLVo973TL+IdDgfOfnl6vgwTnq6FuS1dy3gn60sYLo=;
 b=8vQxbbljLHi5ctbjXGnvpx0s7hUcmZwoEqChv9f7UFEt2WHJsgauYQxdmsMj3k2QtvPq4Px1E
 aqvlQO9Z73xCWko1NMLNcKEsCu4lGQsSo65J/OH2o+UPbItGZHFeTDN
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

The current FSBL can load firmware to any address and can also
disable the coprocessor. Therefore, FSBL should modify the device
tree at runtime. Remove the node accordingly.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index a2797c0bd767..d4e86c15664e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -36,17 +36,6 @@ led-0 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		coprocessor_rtos: region@8fe00000 {
-			reg = <0x8fe00000 0x200000>;
-			no-map;
-		};
-	};
 };
 
 &osc {

-- 
2.55.0

