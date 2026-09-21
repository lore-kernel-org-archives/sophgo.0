Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AA84B0C92
	for <sophgo@lists.linux.dev>; Mon, 21 Sep 2026 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003361; cv=none; b=lPXN7PFjLnpjqUpOGuJPiZ62QRyV0tXLRmW7KIDbHZquLFJv7dACMOhpSLp+jbyRQ98+nFYdB8qp5iNjqFovC32GM55t9kop/TCitOGpf/GYCpF88fa835KTqpFSi8fK6XcgR1tXmo5D19iqaVXbXT3KwV8GrZLbEh+Oq7kCMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003361; c=relaxed/simple;
	bh=7oCgxgnMTJm72ksYvBvCCDiMxSWPCHawhVNGVG3gnF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrDPTdxMo8XRq89gPoCmZgQCYKb6YT/9iUxWY33E7g55q1+5ZHJRDJ3MJoPr2RnggoFfARLIe98posRNWPJUJ2NoX33uaWmHCc60GYXeFOKT/jhBDuYRz5vhajgmqMF5N3sQtjhQF5Il1m/zkrV5IvzlXaKScoL+k3qwljcS02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cd1DVBLh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd1DVBLh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so16133935e9.1
        for <sophgo@lists.linux.dev>; Mon, 21 Sep 2026 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003357; x=1790608157; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/ZOmzg+WvtC9K7MxqhI9dmC9yNAOVlajFGrJ+kti0k=;
        b=Cd1DVBLhyb4yYHkrqrnCduoqA4ibIlZ6y/Z8TzgDf9MATgXHtR0baBZoZ70CiJTSLO
         XMiVEM7hYK5IkvF96rwIcydFZ5RvUhK7jrGTcDR+3/+/vq6x73+3Z+UmF4tdYGCBazeH
         qYGrvZPbWease/gWJkIt0EBdSlg3O4/nVYyLJrwgD2dKTAOkZmDrEmgOFYfmRENNeI8A
         YRwmaEneo4Vr9hS7GZQlDItejXfgx48JDPKlOcVpAH2MlbsyojlCq8h4dN/NIv+PJpZV
         pWZe1XIRvcMDPw0NK1DbFpQBMgFs/cUikYzhZ07fki1W/4rN5hTz3mMQFx4HkRIMNJh/
         PtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003357; x=1790608157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/ZOmzg+WvtC9K7MxqhI9dmC9yNAOVlajFGrJ+kti0k=;
        b=lTzmIRKLHZ82IggkIj6hbd5gUBcGU68mr5bXGi1q7+ftfx/tM2g9Q9Esv7CTj9ZgOg
         oDxd/zvrjkWP4TvKnS1fEhjABREB43o1vQkBP4DGg0BzTMbohHDnxVq7b2InVJ8trfsU
         db9eWgEkfYsSFBLh3+XtZFe+wi0DbyyxWVbNIx4pnXqINr1JRezcOUtE/txCC25EuKf9
         tkAfywoi2nPMEs53HzL++wywWc5FjTRsOrP8/gJfBtIECQ37PYzMetjKqobL+2U3L6T/
         P0WWu4XabAY45h/aBI2F5EZ+rsbw82hDlwe9tAVKU+ccEVemJJh0H4m+oRkhSbVS5G9P
         Kd6A==
X-Forwarded-Encrypted: i=1; AKwUvBzGuDfLzT4spzNb9rOf6h1Q6TTCifjWt87gJEUL+X2RmL0I+ljxAo0EWW13Lyjqm+m4WQ/4s5w=@lists.linux.dev
X-Gm-Message-State: AFuF++l4XFzx+lIH7/9WDAxZ62GS8jRCuT8tk5IPVnuKGjb3Ep/j1UWl
	QhfK9cmBJJ/p8iHJ90swm9Pum/rl77UYoTe1dakZ2X3Dpgz3oP6MEsPi
X-Gm-Gg: AYBFou3ngcfmfKdo/U042TszWgHm6nZUc1ImafYQFslDHu3wiPWhaF2iEaRiHVqeBr/
	QPpNWCAoUn3HcXKFXjSBwdQ7AyBAbAQfmBJiMX/c9Jdk9QcYO78LrbkMtDKCAxeNG9GOtHogJBa
	uzPLJy7v68CJUg8/s9HI4H4nOPfYXfaqvL+Lu/OCXgw7t64moJKhWqotMKIaqmaKzdEsokKo730
	gtKcwEX2JVm2QBucz+R9zAcvcE9LaPHHGBZci49UyCajilpgprmJu/yEcglBBgJyvPRhzBWJbee
	x99YMoHA54t75yp8Rtw6DY8toaylVmwcSO91Fw8OzuEaROAerdKgTj1tCP8jvimgCXD5cOEw+W3
	doAyNo+CKvLsy2P+Ob03YEo2hoFidT2jfVz5cZEwlLwKFxZfKR21o9zoVMtw6H/sCxMvAbl6+3Y
	1Neww/6OGBovHhIlbTpCil6RICLXM9h/WXRcFtJnCfA8HDKwyBeoUidgMZFepAF5C3JWX0jGUgI
	xyGHgqd/g9yhbtqfm/y2GI4x2JObhGtfT8YMbEWEBG1BygANXcbIipXzCk3rQQlKnlOauP64Z5r
	p0iSbX882cQWHHqn
X-Received: by 2002:a05:600c:3b0a:b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fce797ab1mr105033485e9.17.1790003357536;
        Mon, 21 Sep 2026 08:09:17 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:17 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Mon, 21 Sep 2026 17:08:59 +0200
Subject: [PATCH 1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved
 memory node
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-1-ace29446b327@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=917;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=7oCgxgnMTJm72ksYvBvCCDiMxSWPCHawhVNGVG3gnF0=;
 b=/HfpHWWsl0W+IWEQi4abC2w6SqzvmKlMQckSkNlWUn5dc9Mj2OzdmT7rYT+JYx8lh26QfJ78Q
 6nk39nHIi6TCAUn4XyySgyaRyJzuiXrG/1Lw3F+tpSB5erRjmrskv3Y
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

The current FSBL can load firmware to any address and can also
disable the coprocessor. Therefore, FSBL should modify the device
tree at runtime. Remove the node accordingly.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 0e6d79e6e3a4..02848bae2e16 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -22,17 +22,6 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		coprocessor_rtos: region@83f40000 {
-			reg = <0x83f40000 0xc0000>;
-			no-map;
-		};
-	};
 };
 
 &osc {

-- 
2.55.0

