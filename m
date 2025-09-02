Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441032DE70A
	for <sophgo@lists.linux.dev>; Tue,  2 Sep 2025 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818768; cv=none; b=l5gNPwAYBNg8QvxwiTnpEIUiTiu+JM7Z88N8WjRqh8Z5yzZiQz90SsXV1FcSlo+UE5E8zpXSuehiH62RC30/jrpAHfYypEo4aCa/D2QLGu7Rsgcef7qda5ZyH5wWgxa5Hky9XjiMjCDNWVb+okBHkhsyvDlWIG+wYNcKfS6jhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818768; c=relaxed/simple;
	bh=3TePSWGytcC7kHH0ybkbgTqK0AUN90N7ArFutJFlNik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JPyuBxmp4qomGkCnPcRL5zZ2d8Kg1ItwvpX4n9FeO2DsOrHcCgzpMEsY4PBZqLtLnnjq1NqUj71RE5byJK6bpN7QXy/f+Z2wnj5r1V+lcK95V4rzJt9h1+7Wf0E3qsCJ1hXGhg4AiYy/vsOFq/jrwlGOKm7ctY9WAnfMAxS9lWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kpDQ4IgD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y19eCle9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kpDQ4IgD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y19eCle9"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756818765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5msd1yIMdY5vtXm4sNilojUTHfQgb9cCb+7QeNrAlg8=;
	b=kpDQ4IgDMyN94F0DynNn5eSbOI0L2CiD9PXpcjKY27nOaHsHhYZo9oY5Fzxfdxvlq/8bkM
	+SNXQo756Viw8DFyZafHZCYBn9PQrOIqHjvD/d53pLs09r+8P4zQoj7kB9DU5YeBSdPc87
	kr+zO96ahEztJCixdLc8tInsJtjDXDsHbc1yq/9PMrlsTVNYRfYJcQ88j1DK1zKRb3OlG9
	3fiMylo7KCSQKFuD3aXn9cRZ+URgN4huvzCVfvDksCrBUWEqADZBR6l7w16qnZpT8U1qeT
	S4lOxUxU5engXh/y4YqGFWWLm844YlB4fzfCQNq82Bj0gEOYF5h0tDFa6PRcsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756818765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5msd1yIMdY5vtXm4sNilojUTHfQgb9cCb+7QeNrAlg8=;
	b=y19eCle9Wtsczi3sigCknY7Y10aJr8DNqztsevZNiDN6Yb1b0ZzwnJlm3TjrNifp1zMi6c
	6E/pGZAY5Fr8cYBA==
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, inochiama@gmail.com,
 krzk+dt@kernel.org, looong.bin@gmail.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, sycamoremoon376@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: [PATCH v2 0/3] irqchip/sg2042-msi: Set irq type according to DT
 configuration
In-Reply-To: <MAUPR01MB110729FEE220A79D00B52121CFE07A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
 <MAUPR01MB110729FEE220A79D00B52121CFE07A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 02 Sep 2025 15:12:39 +0200
Message-ID: <87seh50zi0.ffs@tglx>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 02 2025 at 07:59, Chen Wang wrote:

Please don't top-post and trim your replies.

> P.S. Since the modification of the DTS part is closely dependent on the 
> modification of the driver part, I am not sure whether you are willing 
> to pick these three patches together, or just pick the driver part and 
> leave the DTS part to me?

They need to go together in the right order obviously.
