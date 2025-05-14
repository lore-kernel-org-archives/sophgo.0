Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD0D2AE8E
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 15:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235788; cv=none; b=Pfxfc4LUfDSBVAQTiGYXWh8NGICbBDniAA8BJccjxZhC4979i57MW7E/GkJJpSxvgYvFeAdtvVse2LZHz1DpyQo/8R4OAqzlHBQhdxrJjs85JzCRUu/OQun7zVB0HrpqYp5+IoXcX3RYpeyHH954cbuYmNLRwPQrCZyS9WjAiG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235788; c=relaxed/simple;
	bh=Lm6WAvlTRDzuea0vIj1PVTw6IFK4Z8B0uPlTZZUwRIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QaS/VP3jfHm5L2629ACVNViIMOKQ2outKzEff5Enm0BwSjxoBlXojOXF5N8KOWgKDuOYiIxnf0WH9QhN9v7uP9Hz4nxAigpXV0Wl4wlliuQ3p9a7WkzrnLzsk1+RttiS8hZPOKgexaxfN+8WRzS5QlVKiPHBNz0MsykNnkqRC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsMo605v; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsMo605v"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e16234307so11612815ad.0
        for <sophgo@lists.linux.dev>; Wed, 14 May 2025 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235786; x=1747840586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgsklLZ/mK5aUC96i1ZN36xx7E9PxV2eHr7rkJneVg4=;
        b=CsMo605vCd7r8H6Lojjsn+FnPO+r2APV2f2gkF8stHOqcbosyp/8Cj9UQS28D8DADd
         0LlRTOghYQb7dPPzRnWkg78xdvG2wvemoGolQM6qmlrpPTNXq1KRDpDcy+QSlHx/LR7Y
         ez+9aZwdcJCkDa5qQAE6/diY2hOcPAp6roO/tY4wj6blvN9PD8r3EEcB1zQ4ILO/LUHw
         9t6mYptoqVblk9stMZVNnX9mkvwGATCEFdGF8HR+kBLd5cYPNfkDVL4d6kMtYto3YDjL
         KosqxiYIHdMv04g1sUIkihbGjx0FaGoiD6ID7Ss1lWq3+fXWsa2ljhrg9almgOMjH2At
         Kogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235786; x=1747840586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgsklLZ/mK5aUC96i1ZN36xx7E9PxV2eHr7rkJneVg4=;
        b=SsGuNHABdCvJNrrayabqm5ruUY/H3BgVz51u15mU2VrZALS/xJ4h9K6HbnVv700snL
         F7hj9YKrJX5HvC664Y8LFlWUKpmPSIPiBEln/Xiz5S0O+jsvLZ/BSIp8W1GiHwohKsiP
         8F2/aP9ZyEYv0gUnPb94D/0VrI9wjzSKqQJJO2BVufrqWOsnmUpesfw26AC57qT287fx
         8SGUXNvC9+kp9vh/YtOb4LzBVX3+Ah6g5C62c3FUu7XtwiREQgj8Dqk358xyXx7NsfzR
         Gqj0ZixiJ/kmpTWwO7cGkGHNchOITWsW9HA2ZS5FwEXyHnKOf/qlgSQ/jWJ20tkCIZ8a
         SHWw==
X-Forwarded-Encrypted: i=1; AJvYcCUR5w1B4M/LjUQXpD048YyA/9d82X6git2paJwcxl9HFsiKMu7ApVbfvyNJd9XhPY7boCStNq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YysoxukrFao5TM2ffx4qDhtrLNUCtKHv2HF6o09EfEFYb2gNkvp
	tSs4ZD3wePwsLQzGWMxPL10nNi0Tkts4jOIE6cS+rmoRRhXAMv40
X-Gm-Gg: ASbGncvnS9BDEFBRuoUnyaZl7Nj0u5GwPLxL6TtgvqYgD0zMAgpI9QIumoAJEFGhFzj
	CBwXSo4ZxHsYWu575JLZIAwglQApCrNryUjkT55XD6/gVIJWSXENDUa2Ma6gSkg0OHgiveZbrOx
	iYCDhhuH+9w+rxL9xPhJrH09BAoZB2QK89nDqXgVmYMkIlX0vDKcUFMvw9F7469+0T+72QnOJY3
	J6QIwgtRe4HSIvmcfnVuKK7muMQ6VgGGnr1z0jw5fgp/dAhB362tB9da1tCOGLdkG+88qeJzCpO
	yvYKFY+iOSMvrqBbYqwuwcyeocfXFpi39xdnTwuvq1Z2At/X3Ru5Lnsw797uaA==
X-Google-Smtp-Source: AGHT+IGbVInxx66G7TdCmzBNdgbF6IdqT5fffqnER/G+POHGsBd0cJTXz0qVz+AMlIIPHrATjD1bLA==
X-Received: by 2002:a17:903:230e:b0:22e:5406:4f62 with SMTP id d9443c01a7336-2317cb62f61mr103264775ad.24.1747235785499;
        Wed, 14 May 2025 08:16:25 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75468besm100576155ad.3.2025.05.14.08.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:16:25 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Wed, 14 May 2025 23:15:49 +0800
Message-ID: <cover.1747235487.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xtheadvector & ziccrse & zfh for sg2042

Thanks,
Han

---

Changes in v2:
  add zfh for sg2042

v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/

Han Gao (3):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042
  riscv: dts: sophgo: add zfh for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 512 ++++++++++++--------
 1 file changed, 320 insertions(+), 192 deletions(-)

-- 
2.47.2

