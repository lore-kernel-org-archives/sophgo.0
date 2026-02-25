Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D93939AA
	for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016072; cv=none; b=Qf5NTeRqh+isgCHmte94OGMITEzVuRuNMkE3y52U9z59zvjUx04jRGaGrxBF963S08+MKNBGM4lLbfV4HEKW9QnLC9dEdBXq+Iv4quwOt925KC38ulmaWHJDzz+8Jwgk9SPUELRkYF+I2wibX4bzQjkLDlH3RzAzUsptiGQgLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016072; c=relaxed/simple;
	bh=yxOj5sToPmLzSh77Wy6Gl4G8jBqGXLhwxbTtGlE3Q7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRwgz+oucc/qLvrlJAEZSqXi1X6snU6ytW+R8Iz5C95veO2VUQEZ5zo8i49K034/GUEKG4lEMVR1vY+6wENYnO4OTqJv52YPaPg/ukKk++867arXPL+kMC8uHXuntWlXgMZyFpo310AUw0gt3WHH4YZUyk01oI8JHRIaqoHNHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ6myZYu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ6myZYu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2aaed195901so30887365ad.0
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 02:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016070; x=1772620870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5JusZ8CeTeNO4qDCoYo5++ntNew4s+UIqyoBHnZ8bM=;
        b=MJ6myZYulSguS0vFzgTUYQrDpc8rPIHDG3Nre7mHGZF7AZx/Cy4kUvgJ8DKqcQkllx
         93i4nnsLKLzJ0+1MpVanD3Xx/gBX2CV1HVCp2/bZp8lrUxL8v7d0myq4NN4QpgcwTCDx
         WteEGC/XqovBe663cly0+ilQrLmpSUFS3vurDfW2LDUSMCruDFvw321wijZ4NH/IL1yM
         emdGRLihTkWukPjXkT/1VNzUvKej24lRuO8R2KMzl7nruU0zBvq3NE6CELd+qE1z082F
         khotnP13W8XSaUPUn1n7KVgXKp0qVxPJe2GYh3NzGkvYdIRG2HJX+W/wmzR9emTwAAm9
         GRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016070; x=1772620870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5JusZ8CeTeNO4qDCoYo5++ntNew4s+UIqyoBHnZ8bM=;
        b=BhFh4DHoTDAb0I7y0lKUgZK2F+das7FxvgaEuFMK1yig1w4i0a3EfRfjNrpGlOux2c
         wDHUL4z3QNuZzbFc4yP9/Fck53X4aw1QhDaiyve5/1eZSa/YzYjuRytqbE589QMkZjw/
         gW4wOOyq2xd8dRJgvVo02JFvzPsS0dCkYKxbX1qbZdCZFBhJBaAeQKkvuUZUWsrwM7x5
         gvYlnSLe8QvYPB42aOmRLUXYiWBhbjrevGUhEQ1lMYnR4USNluN1f7B91MNxQ0ucXAaA
         0/gEWzjvgfRn3pbPnGzt6vh6zvLX7FonrmchT+6HS7k2OSC3CEjVzozJghmYo/kS57v/
         X0yA==
X-Forwarded-Encrypted: i=1; AJvYcCUkjWZGjVqjwo7Cu3WOH6ZOwAX7KTDgXAfeA+p3uX3GKeSgtGo8lb7QK7yNQa1ZeyR9eGot4dU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkYbGIRyTLmOHEFur+IPmgSluPRoJXNMUMRrJ01l2L308JJt96
	maOl2NOZlGrNNkXGuFGjooNXcFjW8Nj6o1VuozIVGn1mc6w9/hSmef6t
X-Gm-Gg: ATEYQzzs/17Q6tJwl9VRDo2M6VLlf9LjAYfkBQW1VH86py9MGKF+9FJ5mBS3O3DwXws
	ULSdw2IAw7CtY5X3PtOKU4CBAvS5dYPOtV6b5uT4VTG+M4J/tq1jHCTfsQUKbH1OZmIYgBK+K+j
	IO4kWrkSANNN9QQFYQhqfCvAJ2rF46OjsGsU+qtZu6fSwLR8/smj8ojHk34dSHjHF3RsIiIC8HW
	5IDeqSyt8BXDHrLwa4zcuItIRRMKYwu2xhOwQt23L05yeSaSfM0qVMAaAKk4Yft1y1bgLF08Wak
	QLx7U5JXUIvD05vgARdIPtgN1tAcp1oVvRKmfSflfqApg11B2V7yWshl+aKDhpqt1Z0NnjfePtG
	bgqDG3PTdt9kVzdtShWaiLAMvPYbgMqtcIBgLY2qyKhQCYCpWOxpBrFAkFgft5nKKPA5Lg03IrD
	/4acIftZLPlYEus7loKL2qFDGf1uxFO+ds
X-Received: by 2002:a17:902:e787:b0:29e:9407:a8cb with SMTP id d9443c01a7336-2ad74548a87mr147819225ad.40.1772016070549;
        Wed, 25 Feb 2026 02:41:10 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adb1bd6b05sm41625085ad.79.2026.02.25.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:10 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
Date: Wed, 25 Feb 2026 18:40:39 +0800
Message-ID: <20260225104042.1138901-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA controller on CV1800B needs to use the DMA phandle args
as the channel number instead of hardware handshake number, so
add a new compatible for the DMA controller on CV1800B.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 216cda21c538..96b0233d9b1b 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - snps,axi-dma-1.01a
           - intel,kmb-axi-dma
+          - sophgo,cv1800b-axi-dma
           - starfive,jh7110-axi-dma
           - starfive,jh8100-axi-dma
       - items:
-- 
2.53.0

