Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95A123393C
	for <sophgo@lists.linux.dev>; Mon,  1 Jun 2026 02:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780282664; cv=none; b=lVPDDDZsV78tTKvDlKNnsFCs9KtW1kZkxMFII75klA8xN9oCrWvECtLEARaKstaOp7MfrugJfIjqgP6mR/3hbJdFuov6B7FXb8jU0iZ0yvAObwvKzUx9QVRaTKsRyArH2sXH9ck8tBceYdMjs3ehtfVNj7QpEYyUpkwfob16+2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780282664; c=relaxed/simple;
	bh=zSGKchj7DnieaMlEjLZS6ee0KpQA1zS6C48G/HdBa/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MP3hBXmmXLqYfeTg8nUoyRDJ8XmoR9JgRYMDZGCNkBRfyYj28O22t8MiF1uZzDodhVQ8cgiBljoKfMczeX/etDfQt3QtmTeCMc7BwOmLgir65w1R8cKkK27n5a+Fahz+jjfBBe1QZdd7GfhLr1/hO+BL9uyMhowtaEPD4Irij6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLDu07zw; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLDu07zw"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84231305a80so617962b3a.0
        for <sophgo@lists.linux.dev>; Sun, 31 May 2026 19:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780282663; x=1780887463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlnR1LMJkAJnnyn7gsy20T1JbQeIaWTtVjvdstsfJOY=;
        b=oLDu07zwJ22CFTlu+JUwB4RJJT1cFUu0jkUl28tr+7iDD3GO8wI4sH0Rk/+V4XGifD
         MGB9SvnPAbTbwU2jeBcp5jt4Ds+E2t5Y7Xp2ywp0yVpjZYWGpuDYGf2QYiU/obYmSU4M
         ang5SyUdkG/xQWql0aAOUbnCiYYW1Oo4CGF39X+vQ+nBi2YVAovPEVyONqe7seJuwKEv
         q520wArme3cmnUn6xQWewv8CbYqszO21BvGnue/VnGOaRr1vgrF02/hcuZOKGsF+VrGw
         NDuhctINZUIfC7P9412qzoogQ3ciVIpbqmcnm3mgjA2zmTx1ZP9sqij7F7CpF9BGCCMO
         mROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780282663; x=1780887463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SlnR1LMJkAJnnyn7gsy20T1JbQeIaWTtVjvdstsfJOY=;
        b=EVyLAxyiIjNVdjuj3oimutWqt3Rn8oPSt74+6Rj213yIbHLM1qT1UKasa2zCf25Qmm
         NDW1iYo1oE8ThzxRYXZ7JsRFUcqXzCC9ZpM54p4Xo4//IQ+3rLh7l7xi4xVBslN589SD
         zO8iz75gN5llv9/aJlmVPC5z+ymdXDo1oaUvC8eM1uoAYhuZGwjetk0vNMVuP/OI3r9X
         M/ZvWsBTrteYGLx9syV2poYaOJQUzD2RgX+bEIozKobyzQqFv34pE5TyUn2iCgcGYlv2
         MOy0uflacA/0RUibII7hP5Y5wD5J+ymxvGJPY8QhoHV2Q03dDpHnx+hipHobPiHKFHwG
         ML6A==
X-Forwarded-Encrypted: i=1; AFNElJ+RjKMsORL+9hwAcVDWVO52Lu9AeDu1cHJURR9Hjy3lftAO3x8EPHfgjZuWhk1eWYuNKYpmDOM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyF/9tciYplM8+/kpQrnPe6t/sX3l/L4IFeNELRyQm4ljdrduKq
	Z7uQE44gwyd5uPiO0jdDo+Xlu+51fXIgUhli1HHzrtQoa1qyBbdME7JM
X-Gm-Gg: Acq92OHyKD/9TmDd9mkJFDI2PWgw9RiRpSrOwURhrp2l7PDxXD16YX/j7GxpeU6nwxH
	FbQ3zgdFHbBRLdJlYUlKA2DndpX7W+VVxlmYB/+ppsQBoG5jitdOHGH0MnC5dYANP/8ALzNMjDf
	nDaDNxfKmA17sBSvBFGV6PKvN99dsQbwgChkTArNlMa2QChmnR0KAZu6vqlIQKn2H5LxRcPIf+z
	Lg+GGaKaeAY/HhdvaXvY2Hc0II9s/eqN+xQhcoh9VI6jhEtf90R/P95uJYqwQDDeTFq0OKUKwp1
	aTpy3ryqW1OC3ghhHUDSNdjg1OnO5xqwgAQsj/JE2csSB2dwWnAbowgrFs9KCnXjqB3P9nWjPqT
	23VvuczVgeO9CkS2LVvGWbT76wI8RXwMwVZYc/+Sc0j+sOdU9AyVBfcdT4hY3S9XacGxogIwAhA
	xFokm2ihRV9m9ok5R4EuECIx9s25HuIwwf4A==
X-Received: by 2002:a05:6a00:b95:b0:82a:65fa:cecf with SMTP id d2e1a72fcca58-8422532cc9emr7978555b3a.4.1780282663043;
        Sun, 31 May 2026 19:57:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84234c99af5sm5151630b3a.53.2026.05.31.19.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 19:57:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	Chen Wang <chen.wang@linux.dev>
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update Chen Wang's email address
Date: Mon,  1 Jun 2026 10:57:23 +0800
Message-ID: <178028263199.557087.12178920232423502381.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507022058.3913-1-chen.wang@linux.dev>
References: <20260507022058.3913-1-chen.wang@linux.dev>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 07 May 2026 10:20:58 +0800, Chen Wang wrote:
> Update my email address as my original email provider may
> block emails in kernel development.

Applied to for-next, thanks!

[1/1] MAINTAINERS: update Chen Wang's email address
      https://github.com/sophgo/linux/commit/b40aa08625c524363c50efafea3fd4c836536e3c

Thanks,
Inochi

