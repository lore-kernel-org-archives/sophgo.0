Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499127603C
	for <sophgo@lists.linux.dev>; Sat,  5 Jul 2025 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751701227; cv=none; b=tluw3LmOYw6fHBfZSFf+cUzePuSHUz//zEkng1lBs6jxbxidUs026jqVQ4zkNuxjPrDJG30HXK0komXa44KF7LMAY9LmFWJ1aguz07FJ8QFYdobXFazqJdqHmcEi+OTXknn4kSXg70TX9MHPOnUnSCW3mZ4oP6f8Uech+3zwa84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751701227; c=relaxed/simple;
	bh=JJszYn717x6LknTSTvPVWMHkPjW4vHXCWm4HWl2cKPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2S77DUI3pRB0J6qTGnkKaRhf4mF3eNJoDTXFa16NQqCUWs1XtwkU5lvr1XDa9qLwpB3Z0AuqBgWmkEPfBDzhOl6TwWBzqn5d1HBVO8UHT0s0uaBRytm+Z861RrQ59kT2EVKO6olZlwcO9hJjtOH8BPYI6JOVJqBRbg89IOPzP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klDeQLCh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klDeQLCh"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7481600130eso2195514b3a.3
        for <sophgo@lists.linux.dev>; Sat, 05 Jul 2025 00:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701225; x=1752306025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TdtCKmCXZJuQXIsMKlprNk8AhOeK48KprK7+CyhBCY=;
        b=klDeQLCh9R8/b6MmUHOr1NsyoccEgex8SZAaQoSc2slbvrW+jPr+5ZaCsSGjWcHYV4
         7LrCzBs0ts9OQxSwAP1G4ArZyAZ7x1cTtjqF8xqg3oLgI4/iEACI3HpPsl9rScKF/ypH
         0aW6kQbGqyBZSNq5pbf649sHIj/6V0zXsppnIPGX8WrqWkIZGzx27oAuioyu7/SUAjsd
         nAgI/OIDITbMU0ssu9DpbfeOmB7ewCSpWa2Ja+StdB4Ed7U3wDZGEpU/bwT0omNbAEZ9
         AdZPzRXeE+oo+d7EUW7hxNKUNxhbrnCUgqOYLCXXGVqju0Ye8wiF6AsoaJxe72j87OXc
         HtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701225; x=1752306025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TdtCKmCXZJuQXIsMKlprNk8AhOeK48KprK7+CyhBCY=;
        b=Crfou7OCarXvj3Q9lKhsuT+kJDBGRZdNI99Qn3Yk5eROao6++0843laVTv4SX0DyCv
         f68qDatY70yTQXi2dWfL2VHKyFG6nBq0yzawe/aG4deFsvTvvpMp+C9sgfnZ9hygpedm
         PSTlJ5Yk2YF7j55vmItf18Q2h79daqfdktCXKuHJUkSL0cDMtd5RNI49PwWPwH51Q9kN
         7YVabrQPACLnh8i2xdEh+ke+l+gRUb9WHkNtN8sbu185xhghSZuYtPN4G3t95VKOf/ZX
         Y47B9iqoirMbQEtzmSE7/rMUOnyC2PFqRHuGwMCMJ+rvzMoSs28TCcrE09p9AKHc2k4h
         R2KA==
X-Forwarded-Encrypted: i=1; AJvYcCU3DurO3eepvgUS06tj9UyBVXblnP/+KHcvz5r0NSguaS0p+wlFjK1pa+lx9HZuxJLlaJJS854=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXxf/WZeCVT9W+K369E92MoeihOOkaOud3WTBJG+suLyXvHzs2
	+st+AyFYLy9u25QQ2V6+B+0w1GOxzzj9fxpjnnAjnU6yPYjuMW/Xiq7b
X-Gm-Gg: ASbGncvIt93W6Mr1kKXaMtDNQinOsY8kuFlNwxSOAUdCUKLQzZxUuchW+/1fINxjg0H
	WHCPon7Vn3TGJL7Sj+sHkz74SyNv1L2M7P28siGPWBCE+HncJE2c67OZZ05u3kvzXxRtEo3RB1N
	49NgTdy/CSi+niH2WEYCAvS9p0Mkf65Rl1LxvjLIAZYt2pBC16okszhtBAv/EnEunJwNuka1r4P
	dFmeNioZAPhKWDRvITApwlRmThcb1vFNaf9Xby+y7uSDpYHaLMHrmOoiFW+MdkWQM7b9w+BoHDM
	LTJJwL4PnLHEo0r/Ru8IVEfmSU2jZbxQM5UWclfZ1ueefvtaK+FW30X8DSy3zlW2LYAl4pGPbq7
	gYl0v5FM=
X-Google-Smtp-Source: AGHT+IHjXclbDebSZEtYRCAUOrQLhMMCQODW3kWiRYwINLupbFQ06Dfe9PNiuFjlOuB4EbYy6RonEw==
X-Received: by 2002:a05:6a00:14c9:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-74ce6669b0emr6653982b3a.13.1751701224987;
        Sat, 05 Jul 2025 00:40:24 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:24 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
Date: Sat,  5 Jul 2025 15:39:54 +0800
Message-ID: <204c8214aa084d592e8dc45d6c5ca23381937b54.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for the Sophgo SG2042_EVB_V1.X/V2.0 board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index b4c4d7a7d7ad..e21b65938a65 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,8 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-evb-v1
+              - sophgo,sg2042-evb-v2
           - const: sophgo,sg2042
       - items:
           - enum:
-- 
2.47.2

