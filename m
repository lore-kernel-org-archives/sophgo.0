Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8004A2DB7BE
	for <sophgo@lists.linux.dev>; Sat, 21 Mar 2026 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774130815; cv=none; b=dbyRIhwgtGtIOXAmPS+yMUSYwC1oc0fE65WAIo23UYrAik9i+eNrgfbRcvkTGQqM7hgLNgFq2H/cpU4ApmGLkv9an3OCCoFgCDzUGSp2wlh4gc+PyYiYqWyXgqaZivb17hzVvvwcE8kU6u5+PUH4fDFNFXiRNHufpeH9o4vjYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774130815; c=relaxed/simple;
	bh=Af3eOZ2o5PhXKSRzIFvJwxgZ/wuT95Wxz/uQTXZmuUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGolkNzCvYZm/Ow/nh0WpLJil/W9Qm1ECBZltte96/tmCztdL8W1Mj7dZ4fI4Yr2iqjCTAQAlTXClaSGzj7/RE1NHhRin1c+bqlbmLlCScy/lk3vckeZttlcJMo2Wpm0n3+8MqGiExlnEH1WqnbcODqVuzIPqLlKhCwhXxVLkRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0BzfHwz; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0BzfHwz"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89a1347051aso29316786d6.2
        for <sophgo@lists.linux.dev>; Sat, 21 Mar 2026 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774130813; x=1774735613; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Af3eOZ2o5PhXKSRzIFvJwxgZ/wuT95Wxz/uQTXZmuUE=;
        b=m0BzfHwzKEKrL+xvAtNEHi7ObhkvYXqAo9S7xxrpjsdoV1GKB0ZklfqEfN9uBKdDtc
         +FCzH+b+uOMlatmhRefG4Q0cQbyNwHBxoGXbO6vd7VwFcJ+DmI/lzFxZqlTVPsLW99Dv
         rqoUX9Wv8CMN16ZOyEyt+wnR6WX8aGXpE8vacxaiKOav/Yk2etAYIx7CjmbfHu85Dt9B
         mrzL4ZPDbeD3vGRR8QZzfpBg9PSKhp6CmhIf5N3261VksQn7rETf8NE3B/PGXWUM2EQu
         UZILEWOtzOWRb6MzlFjTd5rcBcXEMTsl2j+X034Ct74cTG5nD9fX5r9PErAi9kxVkVqJ
         tCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774130813; x=1774735613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af3eOZ2o5PhXKSRzIFvJwxgZ/wuT95Wxz/uQTXZmuUE=;
        b=g7BUR4BUlgbWVA7pXnwEc3OUn1+u8AG6sAfIfKjNqonNulnoHNMK6sziNoThx7jgZ+
         t01sUZY4fob5zar3mZpZBD6+d08bnfFV3tjoym7sRsXU7XwmTAA1iTdindnLmzxHEBYl
         AMCmmC4/kjXbZQ07iz5AWn6fNRy0ay2jqnodCmB7x2dD+ydR9X4nOEzgM7JLyVXQp6hR
         sT1sev8Mrtuym47/e84WkVJrPtH9oB6fndXCnS76yQqsrU03dbw7ngUOZGN8lOTfwYGY
         zvrZnTi+GVVx2Fo0GnvuHJmaqgTziLzK9TtC3d51TRuEML8PBfChPul7f1PNIWmzXyZ1
         +k/w==
X-Forwarded-Encrypted: i=1; AJvYcCU4wDmjCT/vWG3Jzzuu2saAoYgrOf6iNTHfhWWLTv3GuLil0Vu7qhwBFvIHLOdH8u3sr3SHemg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgwqbTa+GP+KBntkADvwDEc5f8TxuOyzf951NBjhRjGbwSzpvU
	WSbyV4rPYQkEaE/hHWnF2Q8k2ipaTqGZACRM7SH33vnxYWksRKeUfS3m
X-Gm-Gg: ATEYQzw0w6IWpzlk+nIvCTRW9HPF1w0JYWEm3LmLIkdRucBtKZiXfP2lvHQb6KqF5u7
	Sz32cQ5Qsok8umCldHrRFLgdGLURerw9G2slFXIeOyDByhttSCZwOv+gx2CkEN/bBkV+urpGyCd
	ZYKUeo1Of6nwYtVmrjCUTuWblDC93kjp3khaPdkmR8RS01IQyK43/I3A070A8QYrj1QrxrjG01q
	qQ+asEVzoeLHtKYxHtOJD9shi6PQrV5m0Xr2r+yGSGa4gABXfmOc5X5nyIgUaOMld67+8lIkJJO
	AiLPYaUvggPXio9E/bfUvOln5PKfLcRBOWz9j5IqypgHbkhJYspZH6FOIBC/S0eTAtvoOUVzosr
	vKg7XPWSYg/w4UFVCF42nhp1GHLVf9U/mE9ANYv0Q9G26xDEcsOvpm91dEjweMj9pFNyiVvDszf
	+2nEGemuU3A/fkaBgyhhJy39sFjoXUYOTPq4x2KRjmBf82vqjLtiem7cpU
X-Received: by 2002:a05:6214:2622:b0:89c:6289:f17d with SMTP id 6a1803df08f44-89c859bee70mr123753836d6.8.1774130813515;
        Sat, 21 Mar 2026 15:06:53 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8536e630sm52425446d6.45.2026.03.21.15.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:06:53 -0700 (PDT)
Date: Sat, 21 Mar 2026 18:06:51 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <ab8Wex56TJB46A9Y@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-2-josh.milas@gmail.com>
 <fdysolp3ogf4ra2kpr565xtkwspk3yqj6ydbkxl67wi7fviabp@x4owynopb6s4>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdysolp3ogf4ra2kpr565xtkwspk3yqj6ydbkxl67wi7fviabp@x4owynopb6s4>

Hi Inochi,

I originally added the board to the cv1812h because I was using that dtsi
on the riscv64 side. I removed it from the list in v3 since I added the
sg2000.dtsi but forgot to add it to the changelog. This is resolved in my
current patchset and notes.

Thanks for the feedback,
- Joshua Milas
