Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E91C84BB
	for <sophgo@lists.linux.dev>; Wed,  1 Apr 2026 00:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003785; cv=none; b=mEY8AjokdZC7iOwVD02PpzrSIsqMGPbWjnbrW+oRo8/kF4RVGvz+8LPywlmoO0Hj8yqNQn3dFhn4ZTx1dXPK9YLAsD9LgCxEUVK+nDEuNPw0GWB79xXDtzG0fXH3E5vJLMvQP+q0CTxO32Z03eYAn6ipK7jWaQDNoCCu2uxh0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003785; c=relaxed/simple;
	bh=rlOwvtt6f3Z1BcZUx9uEMq0VrEm/GZdnwYd1pS7N/9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmBWSnjst2SXov4Q07nqgGFAIjUgilVb0c7DAb5dEj6TRzo/wg22lsEGO/Irpj4DzLZwruhDb1/4GPcBDyFNqwb5MzwVthbaG8sIra+25uE99SkNJZzOB424pga5+x+1yg6MEiJlkWQCCbenDYCm8WOe+5pB6IVQe8l9l8LjdR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPxv9LBo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPxv9LBo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab39b111b9so26592685ad.1
        for <sophgo@lists.linux.dev>; Tue, 31 Mar 2026 17:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775003783; x=1775608583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47uua8HSMbLz1yUa2gyHVcotrdKJh4LwpMJOOpPOG6k=;
        b=aPxv9LBof4Qd1PTkIAc730V6LERRQowYDeH4f8zDGqlowsJY3UrQJWPfgRujI3K3Un
         hDHnWprFrJ+azmLyY5iwrSfejU2hcYQFzul1Z+E5Vw/JaAMZhSFQWRXGTTvPz9LwRCkn
         rLMkoaUs1TZ008VzTvxYeYTUjBXF2OJ9LFQELtO0mrB6iUfpy/gtcHue8U/AlpHCXPaP
         Nipj17jYHtF0Rt3YipV7XQf2zAyqFEfZQ1MM3VfDuLODX7P/8cKNSBt6LMVMM+ldeE6d
         JSkA3cW/7HkD+G6wedl8C7f7hW13coWJIcBTseC6da5mN4BqTi5hcD8h8VczycUZu3MR
         w1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003783; x=1775608583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47uua8HSMbLz1yUa2gyHVcotrdKJh4LwpMJOOpPOG6k=;
        b=okUWc+9A+AAFlfNIcpyvb9a2F1kls4A6qFcb9tot83VItsUN/BFQ9FRANeT1sPUSkq
         OqCb0h/Xiq1YJ2TTfvTJUYR5niqVeXsyTkLksD8sgrP1W9U07HOO1cqL7Ux9uLrs34y5
         y9OooBkCgS6OJWnnw7kMqtUrCKz+Vx8Q5Xg1wKjpwQio3/SUJIvVIQ8+AaL8qAHCo6Zh
         k/ceA0V0loGhcuhJWtuGPxxZbfYyO6PjFCnVDW3vXVYtKEf+46bibFsj34vj9vNQoMjl
         WhdIQi9br+QBfXpMzoAMEsn1C79YOBO+wKIS81HXy5WsnS4XEUsVNx7XevfSz0ZrYo5N
         lNBA==
X-Forwarded-Encrypted: i=1; AJvYcCWIA44iqcm/w4djsSoWZmdwL08S8mXOSoUUq+tlyWQH5Ynv4CoC8jmItCInj+ZKCVf/lurCs4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyWol01hmFvlWBJ541k3xaUacPK7Dwr47kwyx6EuWuSHbpaJoP
	XjZvDIUoHQb2az0mC/kAfaJlHwXMygBehwIbQ1yHzD90w/HhQP2UQkygctHjepqG
X-Gm-Gg: ATEYQzz1Yhq9R+ZkuYXg+9d7E/JPaw/Fexo7V5r4HwqIhXOMc3QclAJj2tKCJDnPI8I
	eAxRr7fVCAqguYBu6FzmCUHbOhF0W9l8AD3x/CoeBUyKzWlzVg7MI2rjYr/XL+N3XCWg2mogB3P
	QwwLpy69IvUR4CkCY/kpZcvDY05HNj2y6nVT/LS4UmNtIGMWh9elK8g6wiPSWGlgv6B8cgPWYD8
	sY9XFbcNcD8mEAREkQ+txDJWzORsRPCiOQ/XC97FPNu7xeTbFEtd+ZMVdJd5uQt+QtO6mk7rMUX
	ZH92weo/u5dSirMT8QPOtwJ0H5V9coeaY4r1y7I5TSFaXZojcA0pNC/JQ3rCPbI7Q6Kb4h3esZD
	/SdXLhN8rY+oOq2YCodso6HzY7vjwSYrJyKbmRMG0C5JmKfP+x8QTGqRBSIVNjj+hMFFGlVF6gF
	nrwoq1Fm2Rs3KGg3PBPtqt2LQ=
X-Received: by 2002:a17:903:906:b0:2b0:775f:febf with SMTP id d9443c01a7336-2b269cdd077mr11500025ad.40.1775003783502;
        Tue, 31 Mar 2026 17:36:23 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242787bc7sm130207665ad.59.2026.03.31.17.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:36:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] pinctrl: sophgo: pinctrl-sg2042: Fix wrong module description
Date: Wed,  1 Apr 2026 08:35:49 +0800
Message-ID: <20260401003552.363205-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401003552.363205-1-inochiama@gmail.com>
References: <20260401003552.363205-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the SoC model in module description string, it should be
sg2042 instead of sg2002.

Fixes: 1e67465d3b74 ("pinctrl: sophgo: add support for SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-sg2042.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.c b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
index 185305ac897d..8dba12e122a4 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
@@ -651,5 +651,5 @@ static struct platform_driver sg2042_pinctrl_driver = {
 };
 module_platform_driver(sg2042_pinctrl_driver);
 
-MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
+MODULE_DESCRIPTION("Pinctrl driver for the SG2042 series SoC");
 MODULE_LICENSE("GPL");
-- 
2.53.0

