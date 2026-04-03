Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E27388394
	for <sophgo@lists.linux.dev>; Fri,  3 Apr 2026 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214966; cv=none; b=nepucpPT2ar7M4LltqAvLpyN4iPwJ3ic9OkFmg7P1Ks7WFKpuYPkfEB7lSi+PIQ775nv4wQvSSmJaPidDyX2jQvUiF6C/dDff9BKBsueYdOetTYBdKxGkLbDDp9pqSLO8d8wpfniV87mcf3Qr/T/bE3TDjgYuToMJKVHdJjYk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214966; c=relaxed/simple;
	bh=cmszwX0Ji3XjQt7Fpy6t/qmhlzCiNP9RsFnOxecQxzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMeIRkxjnwk8B6eKnKYTdiRoVoOFuPHwB9Y0s5ZQSlNeSj+BRnK2vhog6cjV0neAEysY/X567/apAjd29QnKl5jw8eNpVEFBQng5OkvxWHVssyavHc5IlQ4pVEJFrxyf/EJCaEUgdPppJ9az7EnjF1lbVWGeOcxpyhgLvW57hWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vmp9dVab; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vmp9dVab"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89f1e767f92so16256596d6.2
        for <sophgo@lists.linux.dev>; Fri, 03 Apr 2026 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214963; x=1775819763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=Vmp9dVabDwcvTiYgD5/c4eJ0wlaKBNWUcBAikFWjs14o1uEhchyBNylp0tv/ptrtKz
         5lDNZ9nkaOvnXICBphjEu8y/gx+ZrbUym4oeHHAOx/tvZPgJ3zYA7s8kJPMz/+wTelVv
         uRXMNmA6196Jqti0COfbogOvQnQmKHFjmozIrbzmBnf5KVLKEkFtEF75mtecCi4JTtAN
         SwD7jiUkt8HRrBVd9p7oJjldRy7bhunwuuJbEWZxTHh96dkn6cI3S0HD6knUnBtK5+KF
         J9k47x+25JaUpTL6QCjhiVBZOJrMFBSdw3nI0wwFkP1no/pRMp+NHFfGxAoL2LBS2i7k
         PO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214963; x=1775819763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=D2JPS/7yYBlNBl3Op5NGscr2cRn6IMFsRHwaT/KUI99Nord1QnGWc3TH4DcKLz5Vig
         GaWzNSQwUnGh9tUmQvV60FUpjoyW8ZRhTpeqD4wtmxLG+ctSZlZeC2vXylCNBtO/dolP
         S6oqk0VXU+IucgsvRS1oDxfpV+/MCsx700TLjqyWgqRmZ6cIgNAQw6DCDLhkUkH2lJRb
         GpRhnkj5K6gyjk7QCOvJD4Owu8yGllalKcZj/C00EVCxvvuGJT8jUJqlRI7VkIR2HxeJ
         pYmtBsBO4TrLPMJbR+aa1cu1KKb8WVpwJQnuanQAlDLMah9yQFX/BsvsOZs8QPuzgfNe
         Gz4w==
X-Forwarded-Encrypted: i=1; AJvYcCUsA4/lnn96dXXrFFnak1I3o4uKZDZqzjDIY+AOLdcxKkeZv9SOyUPQnfYS+oGe0oo8AUd1nU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMkS7uzUBnGnhrHKdOepBusKXyK+N/4gVHoqrCikvLHZ2pWEHF
	FydqOpJV4ns7qR0PK8qGO0AzU1qtako3D4XHaSEb1Deuwp++igl4xT9G
X-Gm-Gg: AeBDietDOQaAk14OAe/pavX3ZsqID/8p/wfY0mPYWCYiFq68cLfoyrelwCBQL7nqAeY
	/esEOUXylthEibtW27Hv0mDAvrFLfbU2YNbp6OIy0UNZTK6Y2Q3atNQP6GO0ToEIP3jl69fBGjb
	JtR7wvZ7Kcm4E0wv+kR18VrTukUPqj4KfB9ddKNCgC9p2NMRhoWyzN7yQn6kOo51L45alKxSfCs
	vyLzH9A0TpN2eq6Nrbj/S25tNSy78vuwtH8n9prNZRIfCEpU1RLi1WAv9VBu3slwybFan41THsx
	DCLhTnV4Cx6w+5We0SBLVLS44tQq+KZ1Dd4rsgPKsRBVpKC8YRqJ9MOXjdx1XyWljAH5zGJD4+G
	Nduv3rbqe8rJnJtcivSwsP9uC2pXexswcLCECpM+qWuBMZ+0lhWeYiLvpNtRgjYJ5XCQxUPHXE0
	ucGKwLwGCOKT830JypXlXekEefpv4g
X-Received: by 2002:a05:6214:4186:b0:899:f6bb:331f with SMTP id 6a1803df08f44-8a704bb884fmr39763376d6.41.1775214963119;
        Fri, 03 Apr 2026 04:16:03 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:02 -0700 (PDT)
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
Subject: [PATCH v5 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Fri,  3 Apr 2026 07:15:14 -0400
Message-ID: <20260403111516.379795-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the sg2000 interrupt
controller and timer.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887ec..decc43df3c839 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -73,6 +73,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9b..54266b3c2a185 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -50,6 +50,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.53.0

